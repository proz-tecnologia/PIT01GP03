import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/app/services/mock_transaction.dart';

class TransactionListController extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List transactionList = [];
  // final List<TransactionModel> transactionList = [...transactionsMock];

  //TODO MUDAR DE STREAM PARA FUTURE
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

  Future updateTransaction(TransactionModel transaction) async {

    firestore
        .collection('transactionDB')
        .doc(transaction.id)
        .set(transaction.toMap());

    notifyListeners();
  }

  Future removeTransaction(TransactionModel transaction) async {
    final id = transaction.id;
    final date = firestore.doc("transactionDB/$id");

    date.delete();
    notifyListeners();
  }
}
