import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/app/services/mock_transaction.dart';

class TransactionListController extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final List<TransactionModel> transactionList = [];
  // final List<TransactionModel> transactionList = [...transactionsMock];

  Stream<List<TransactionModel>> readTransactions() => firestore
      .collection('transactionDB')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => TransactionModel.fromJson(doc.data()))
          .toList());

  Future addTransaction(TransactionModel transaction) async {
    final newTransaction = firestore.collection('transactionDB').doc();
    transaction.id = newTransaction.id;
    final json = transaction.toJson();
    await newTransaction.set(json);
    notifyListeners();
  }

  // void addTransaction(TransactionModel transaction) {
  //   final newTransaction =
  //       transaction.copyWith(id: transaction.hashCode.toString());
  //   transactionList.add(newTransaction);
  //   notifyListeners();
  // }

  void updateTransaction(TransactionModel transaction) {
    for (int i = 0; i < transactionList.length; i++) {
      if (transactionList[i].id == transaction.id) {
        transactionList[i] = transaction;
      }
    }
    notifyListeners();
  }

  // void updateTransaction(TransactionModel transaction) {
  //   for (int i = 0; i < transactionList.length; i++) {
  //     if (transactionList[i].id == transaction.id) {
  //       transactionList[i] = transaction;
  //     }
  //   }
  //   notifyListeners();
  // }

  void removeTransaction(TransactionModel transaction) {
    transactionList.remove(transaction);
    notifyListeners();
  }
}


// TODO: CHARLESTON: Incrementar FOR EACH e WHERE