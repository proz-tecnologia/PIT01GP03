import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/features/home/home_firebase_repository.dart';

//TODO PAULO TROCAR NO NOME CLASSE

class HomeController extends ChangeNotifier {
  

  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);



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

/*

final List<TransactionModel> items = [];


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
*/



