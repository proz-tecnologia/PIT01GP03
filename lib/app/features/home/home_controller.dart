import 'package:flutter/material.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/app/services/mock_transaction.dart';

class TransactionController extends ChangeNotifier {

  final List<TransactionModel> items = [...transactionsMock];

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
    if (!items.contains(transaction)) {
      items.add(transaction);
      if (transaction.category == true) {
        itemsSum.add(transaction);
      } else {
        itemsSubtraction.add(transaction);
      }

      notifyListeners();
    }
  }

  void update(TransactionModel transaction) {
    for (int i = 0; i < items.length; i++) {
      if (items[i] == transaction) {
        items[i] = transaction;
        if (transaction.category == true) {
          itemsSum[i] == transaction;
        } else if (transaction.category == false) {
          itemsSubtraction[i] = transaction;
        }
        notifyListeners();
      }
    }
  }

  void remove(TransactionModel transaction) {
    items.remove(transaction);

    if (itemsSubtraction.contains(transaction)) {
      itemsSubtraction.remove(transaction);
    } else if (itemsSum.contains(transaction)) {
      itemsSum.remove(transaction);
    }

    notifyListeners();
  }
}
