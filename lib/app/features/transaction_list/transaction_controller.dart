import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_state.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:porkinio/locator.dart';

class TransactionController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TransactionListState _transactionListState = TransactionListInitialState();
  TransactionListState get state => _transactionListState;

  void _updateState(TransactionListState newState) {
    _transactionListState = newState;
    notifyListeners();
  }

  Future createTransaction(TransactionModel transaction) async {
    _updateState(
      TransactionListLoadingState(),
    );
    try {
      final newTransaction = _firestore.collection('transactions').doc();
      transaction.id = newTransaction.id;
      transaction.userId = locator.get<AuthService>().currentUser!.uid;
      await newTransaction.set(
        transaction.toJson(),
      );
      _updateState(
        TransactionListSuccessState(),
      );
    } catch (e) {
      _updateState(
        TransactionListErrorState(),
      );
    }
  }

  Stream<List<TransactionModel>> readAllTransactions() {
    return _firestore
        .collection('transactions')
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
    _updateState(
      TransactionListLoadingState(),
    );
    try {
      transaction.userId = locator.get<AuthService>().currentUser!.uid;
      await _firestore.collection('transactions').doc(transaction.id).set(
            transaction.toMap(),
          );
      _updateState(
        TransactionListSuccessState(),
      );
    } catch (e) {
      _updateState(
        TransactionListErrorState(),
      );
    }
  }

  Future deleteTransaction(TransactionModel transaction) async {
    _updateState(
      TransactionListLoadingState(),
    );
    try {
      final id = transaction.id;
      final documentId = _firestore.doc("transactions/$id");
      await documentId.delete();
      _updateState(
        TransactionListSuccessState(),
      );
    } catch (e) {
      _updateState(
        TransactionListErrorState(),
      );
    }
  }
}
