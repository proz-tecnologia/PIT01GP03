import 'package:flutter/material.dart';
import 'package:porkinio/app/models/transaction_model.dart';

class TransactionListController extends ChangeNotifier {
  final List<TransactionModel> transactionList = [];

  void addTransaction(TransactionModel transaction) {
    final newTransaction =
        transaction.copyWith(id: transaction.hashCode.toString());
    transactionList.add(newTransaction);
    notifyListeners();
  }

  void updateTransaction(TransactionModel transaction) {
    for (int i = 0; i < transactionList.length; i++) {
      if (transactionList[i].id == transaction.id) {
        transactionList[i] = transaction;
      }
    }
    notifyListeners();
  }

  void removeTransaction(TransactionModel transaction) {
    transactionList.remove(transaction);
    notifyListeners();
  }
}


// TODO: CHARLESTON: Incrementar FOR EACH e WHERE