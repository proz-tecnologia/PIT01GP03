import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:porkinio/locator.dart';

class TransactionListController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final AccountBalanceCardController accountBalanceCardController =
  //     AccountBalanceCardController();

  Future createTransaction(TransactionModel transaction) async {
    final newTransaction = _firestore.collection('transactionTest').doc();
    transaction.id = newTransaction.id;
    transaction.userId = locator.get<AuthService>().currentUser!.uid;
    await newTransaction.set(transaction.toJson());
    notifyListeners();
  }

  Stream<List<TransactionModel>> readAllTransactions() {
    return _firestore
        .collection('transactionTest')
        .where('userId', isEqualTo: locator.get<AuthService>().currentUser!.uid)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TransactionModel.fromJson(doc.data()))
            .toList());
  }

  Future updateTransaction(TransactionModel transaction) async {
    transaction.userId = locator.get<AuthService>().currentUser!.uid;
    await _firestore
        .collection('transactionTest')
        .doc(transaction.id)
        .set(transaction.toMap());
    notifyListeners();
  }

  Future deleteTransaction(TransactionModel transaction) async {
    final id = transaction.id;
    final date = _firestore.doc("transactionTest/$id");
    await date.delete();
    notifyListeners();
  }
}
