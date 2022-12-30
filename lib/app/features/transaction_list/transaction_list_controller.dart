import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/models/transaction_model.dart';

class TransactionListController extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List transactionList = [];
  // final List<TransactionModel> transactionList = [...transactionsMock];

  Future createTransaction(TransactionModel transaction) async {
    final newTransaction = firestore.collection('transactionDB').doc();
    transaction.id = newTransaction.id;
    await newTransaction.set(transaction.toJson());
    notifyListeners();
  }

  Stream<List<TransactionModel>> readAllTransactions() => firestore
      .collection('transactionDB')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => TransactionModel.fromJson(doc.data()))
          .toList());

  Future updateTransaction(TransactionModel transaction) async {
    firestore
        .collection('transactionDB')
        .doc(transaction.id)
        .set(transaction.toMap());
    notifyListeners();
  }

  Future deleteTransaction(TransactionModel transaction) async {
    final id = transaction.id;
    final date = firestore.doc("transactionDB/$id");
    date.delete();
    notifyListeners();
  }
}
