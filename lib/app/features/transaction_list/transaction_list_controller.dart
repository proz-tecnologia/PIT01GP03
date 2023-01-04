import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/models/transaction_model.dart';

class TransactionListController extends ChangeNotifier {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List transactionList = [];
  // final List<TransactionModel> transactionList = [...transactionsMock];

  Future createTransaction(TransactionModel transaction) async {
    final newTransaction = _firestore.collection('transactionDB').doc();
    transaction.id = newTransaction.id;
    await newTransaction.set(transaction.toJson());
    notifyListeners();
  }

  Stream<List<TransactionModel>> readAllTransactions() => _firestore
      .collection('transactionDB')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => TransactionModel.fromJson(doc.data()))
          .toList());

  Future updateTransaction(TransactionModel transaction) async {
    _firestore
        .collection('transactionDB')
        .doc(transaction.id)
        .set(transaction.toMap());
    notifyListeners();
  }

  Future deleteTransaction(TransactionModel transaction) async {
    final id = transaction.id;
    final date = _firestore.doc("transactionDB/$id");
    date.delete();
    notifyListeners();
  }
}
