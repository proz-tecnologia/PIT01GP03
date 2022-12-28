import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/features/home/HomeRepository_firebase..dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/app/services/firebase_auth_service.dart';

//TODO PAULO TROCAR NO NOME CLASSE

class TransactionController extends ChangeNotifier {
  final List<TransactionModel> items = [];

  final HomeRepository _homeRepository;

  TransactionController(this._homeRepository);

  double total() {
    double totalSum = 0;
    double totalSubtraction = 0;
    double totalValue = 0;
    for (var value in items) {
      if (value.category == true) {
        totalSum += value.ammount;
      } else if (value.category == false) {
        totalSubtraction += value.ammount;
      }
    }
    totalValue = totalSum - totalSubtraction;
    return totalValue;
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
      if (value.category == false) {
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

  final _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  Future<void> getTransactions() async {
    try {
      final userID = _auth.currentUser?.uid;
      final result = await _homeRepository.getTransactionModel(userID ?? '');
    } catch (e) {
      rethrow;
    }
  }
}




//TODO: CHARLESTON INCREMENTAR FOR EACH E .WHERE  