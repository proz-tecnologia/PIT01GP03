import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_state.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:porkinio/locator.dart';

class TransactionListController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TransactionListState _transactionListState = TransactionListInitialState();
  TransactionListState get state => _transactionListState;

  void _updateState(TransactionListState newState) {
    _transactionListState = newState;
    notifyListeners();
  }

  Future createTransaction(TransactionModel transaction) async {
    final newTransaction = _firestore.collection('transactionDB').doc();
    transaction.id = newTransaction.id;
    transaction.userId = locator.get<AuthService>().currentUser!.uid;
    await newTransaction.set(
      transaction.toJson(),
    );
    _updateState(
      TransactionListSucessState(),
    );
  }

  Stream<List<TransactionModel>> readAllTransactions() {
    return _firestore
        .collection('transactionDB')
        .where('userId', isEqualTo: locator.get<AuthService>().currentUser?.uid)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => TransactionModel.fromJson(
                  doc.data(),
                ),
              )
              .toList(),
        );
  }

  Future updateTransaction(TransactionModel transaction) async {
    transaction.userId = locator.get<AuthService>().currentUser!.uid;
    await _firestore.collection('transactionDB').doc(transaction.id).set(
          transaction.toMap(),
        );
    notifyListeners();
  }

  Future deleteTransaction(TransactionModel transaction) async {
    try {
      _updateState(
        TransactionListLoadingState(),
      );
      final id = transaction.id;
      final documentId = _firestore.doc("transactionDB/$id");
      await documentId.delete();
      _updateState(
        TransactionListSucessState(),
      );
    } catch (e) {
      _updateState(
        TransactionListErrorState(),
      );
    }
  }
}
