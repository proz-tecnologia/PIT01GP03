import 'package:flutter/material.dart';
import 'package:porkinio/app/models/transaction_model.dart';


//TODO PAULO TROCAR NO NOME CLASSE

class TransactionController extends ChangeNotifier {

  final List<TransactionModel> items = [];

  double total() {
    double total = 0;
    for (var value in items) {
      total += value.ammount;
    }
    return total;
  }

  double sum() {
    double total = 0;
    for (var value in items) {
      if (value.category == true) {
        total += value.ammount;
      }      
    }
    return total;
  }

  double subtraction() {
    double total = 0;
    for (var value in items) {
      if(value.category == false){
        total -= value.ammount;
     }
    }
    return total;
  }

  bool visibilityOn = true;

  void add(TransactionModel transaction) {
    final newTransaction =
        transaction.copyWith(id: transaction.hashCode.toString());
    items.add(newTransaction);
    notifyListeners();
  }

  void update(TransactionModel transaction) {
    for (int i = 0; i < items.length; i++) {
      if (items[i].id == transaction.id) {
        items[i] = transaction;
      }
    }
    notifyListeners();
  }

  void remove(TransactionModel transaction) {
    items.remove(transaction);
    notifyListeners();
  }
}


//TODO: CHARLESTON INCREMENTAR FOR EACH E .WHERE  