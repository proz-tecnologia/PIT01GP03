import 'package:flutter/material.dart';
import 'package:porkinio/app/models/transaction_model.dart';

class TransactionController extends ChangeNotifier {
  final List<TransactionModel> items = [];

  final List<TransactionModel> itemsSum = [];

  final List<TransactionModel> itemsSubtraction = [];

  double total() {
    double total = 0;

    for (var value in itemsSum) {
      total += value.ammount;
    }

    for (var value in itemsSubtraction) {
      total -= value.ammount;
    }

    return total;
  }

  double sum() {
    double total = 0;
    for (var value in itemsSum) {
      total += value.ammount;
    }
    return total;
  }

  double subtraction() {
    double total = 0;
    for (var value in itemsSubtraction) {
      total -= value.ammount;
    }
    return total;
  }

  bool visibilityOn = true;

  void add(TransactionModel transaction) {
    final newTransaction =
        transaction.copyWith(id: transaction.hashCode.toString());
    items.add(newTransaction);
    
    if (newTransaction.category == true) {
      itemsSum.add(newTransaction);
    } else if (newTransaction.category == false) {
      itemsSubtraction.add(newTransaction);
    }

    notifyListeners();
  }

  void update(TransactionModel transaction) {
    for (int i = 0; i < items.length; i++) {
      if (items[i].id == transaction.id) {
        items[i] = transaction;
      }

      if (itemsSum[i].id == transaction.id) {
        itemsSum[i] = transaction;
      } else if (itemsSubtraction[i].id == transaction.id) {
        itemsSubtraction[i] = transaction;
      }

    }
    notifyListeners();
  }

  void remove(TransactionModel transaction) {
    items.remove(transaction);
    notifyListeners();
  }
}
