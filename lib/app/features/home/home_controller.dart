import 'package:flutter/material.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/app/services/mock_transaction.dart';

class TransactionController extends ChangeNotifier {
  final List<TransactionModel> _items = [...transactionsMock];

  final List<TransactionModel> _itemsSum = [];

  final List<TransactionModel> _itemsSubtraction = [];

  int get count => _items.length;

  List<TransactionModel> get all {
    return [..._items];
  }

  double total() {
    double total = 0;

    for (var value in _itemsSum) {
      total += value.ammount;
    }

    for (var value in _itemsSubtraction) {
      total -= value.ammount;
    }

    return total;
  }

  double sum() {
    double total = 0;
    for (var value in _itemsSum) {
      total += value.ammount;
    }
    return total;
  }

  double subtraction() {
    double total = 0;
    for (var value in _itemsSubtraction) {
      total -= value.ammount;
    }
    return total;
  }

  bool visibilityOn = true;

  TransactionModel byIndex(int i) {
    return _items.elementAt(i);
  }

  void add(TransactionModel transaction) {
    if (!_items.contains(transaction)) {
      _items.add(transaction);
      _itemsSubtraction.add(transaction);
      _itemsSum.add(transaction);
      notifyListeners();
    }
  }

  void update(TransactionModel transaction) {
    for (int i = 0; i <= _items.length; i++) {
      if (_items[i] == transaction) {
        _items[i] = transaction;
        _itemsSubtraction[i] = transaction;
        _itemsSum[i] == transaction;
        notifyListeners();
      }
    }
  }

  void remove(TransactionModel transaction) {
    _items.remove(transaction);
    _itemsSubtraction.remove(transaction);
    _itemsSum.remove(transaction);
    notifyListeners();
  }
}


/* 
class TransactionController extends ChangeNotifier {

  final Map<String, TransactionModel> _items = {};

  final Map<String, TransactionModel> _itemsSum = {};

  final Map<String, TransactionModel> _itemsSubtraction = {};

  List<TransactionModel> get all {
    return [..._items.values];
  }

  int get count => _items.length;


  double total() {
    double total = 0;

    _itemsSum.forEach((key, value) {
      total += value.ammount;
    });

    _itemsSubtraction.forEach((key, value) {
      total -= value.ammount;
    });

    return total;
  }

  double sum() {
    double total = 0;
    _itemsSum.forEach((key, value) {
      total += value.ammount;
    });
    return total;
  }

  double subtraction() {
    double total = 0;
    _itemsSubtraction.forEach((key, value) {
      total -= value.ammount;
    });
    return total;
  }

  bool visibilityOn = true;

  TransactionModel byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(TransactionModel transaction) {
    if (transaction.id != null &&
        transaction.id!.trim().isNotEmpty &&
        _items.containsKey(transaction.id)) {
      _items.update(
        transaction.id!,
        (_) => TransactionModel(
            id: transaction.id,
            title: transaction.title,
            ammount: transaction.ammount,
            date: transaction.date,
            category: transaction.category),
      );

      if (transaction.category == true) {
        _itemsSum.update(
          transaction.id!,
          (_) => TransactionModel(
              id: transaction.id,
              title: transaction.title,
              ammount: transaction.ammount,
              date: transaction.date,
              category: transaction.category),
        );
      } else if (transaction.category == false) {
        _itemsSubtraction.update(
          transaction.id!,
          (_) => TransactionModel(
            id: transaction.id,
            title: transaction.title,
            ammount: transaction.ammount,
            date: transaction.date,
          ),
        );
      }
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => TransactionModel(
            id: id,
            title: transaction.title,
            ammount: transaction.ammount,
            date: transaction.date,
            category: transaction.category),
      );
      if (transaction.category == true) {
        _itemsSum.putIfAbsent(
          id,
          () => TransactionModel(
              id: id,
              title: transaction.title,
              ammount: transaction.ammount,
              date: transaction.date,
              category: transaction.category),
        );
      } else if (transaction.category == false) {
        _itemsSubtraction.putIfAbsent(
          id,
          () => TransactionModel(
              id: id,
              title: transaction.title,
              ammount: transaction.ammount,
              date: transaction.date,
              category: transaction.category),
        );
      }
    }
    notifyListeners();
  }

  void remove(TransactionModel transaction) {
    if (transaction.id != null) {
      _items.remove(transaction.id);
      _itemsSubtraction.remove(transaction.id);
      _itemsSum.remove(transaction.id);
      notifyListeners();
    }
  }
}
*/