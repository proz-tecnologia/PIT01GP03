import 'dart:math';
import 'package:flutter/material.dart';
import 'package:porkinio/app/models/transaction_model.dart';

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
