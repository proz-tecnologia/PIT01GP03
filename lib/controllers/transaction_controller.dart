import 'dart:math';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/models/transaction_model.dart';

class TransactionController with ChangeNotifier {
  final Map<String, TransactionModel> _items = {};
  // final List<TransactionModel> _items = [...dummyTransaction];

  List<TransactionModel> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }


  TransactionModel byIndex(int i) {
    return _items.values.elementAt(i);
  }

  
  void put(TransactionModel data) {

    final id = Random().nextDouble().toString();

    if (_items.containsKey(data.id)) {
      _items.update(
          data.id!,
          (value) => TransactionModel(
                id: data.id,
                name: data.name,
                value: data.value,
                date: data.date,
       //         iconUrl: 'https://imgur.com/YtXmL9b',
              ));
    } else {
      // adicionar
      _items.putIfAbsent(
          id,
          () => TransactionModel(
                id: data.id,
                name: data.name,
                value: data.value,
                date: data.date,
    //           iconUrl: 'https://imgur.com/YtXmL9b',
              ));
    }
    notifyListeners();
  }

  void remover(TransactionModel data) {
    _items.remove(data.id);
    notifyListeners();
  }

}



/*

  List<TransactionModel> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  TransactionModel byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(TransactionModel data) {
    if (data == null) {
      return;
    }

    final id = Random().nextDouble().toString();

    if (data.id!.trim().isNotEmpty && _items.containsKey(data.id)) {
      _items.update(
          data.id!,
          (value) => TransactionModel(
                id: data.id,
                name: data.name,
                value: data.value,
                date: DateTime.now(),
              ));
    } else {
      // adicionar
      _items.putIfAbsent(
          id,
          () => TransactionModel(
                id: data.id,
                name: data.name,
                value: data.value,
                date: data.date,
              ));
    }
    notifyListeners();
  }

  void remover(TransactionModel data) {
    _items.remove(data.id);
    notifyListeners();
  }
*/