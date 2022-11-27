import 'dart:math';

import 'package:flutter/material.dart';

import '../models/transaction_model.dart';

class TransactionController with ChangeNotifier {
  // Inicializa a lista de transações a partir do modelo dummyTransactions
  // final Map<String, TransactionModel> _items = {...dummyTransactions};

  // Inicializa um mapa de lista de transações vazia
  final Map<String, TransactionModel> _items = {};

  // Variável que retorna uma lista a partir do modelo com todos os itens
  List<TransactionModel> get all {
    return [..._items.values];
  }

  // Variável que retorna a quantidade de itens dentro da lista de transações
  int get count {
    return _items.length;
  }

  static get dummyTransactions => null;

  // Gera o elemento da lista de transações a partir do índice em que foi adicionado
  TransactionModel byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(TransactionModel transaction) {
    // Se não for nulo e vazio, e tiver instanciado
    if (transaction.id != null &&
        transaction.id!.trim().isNotEmpty &&
        _items.containsKey(transaction.id)) {
      // Método que atualiza a transação a partir de sua ID com os valores do campo
      _items.update(
        transaction.id!,
        (_) => TransactionModel(
          id: transaction.id,
          title: transaction.title,
          description: transaction.description,
          ammount: transaction.ammount,
          date: transaction.date,
        ),
      );
    } else {
      // Se estiver nulo ou vazio, gerar uma ID a partir do método Random
      final id = Random().nextDouble().toString();
      // Método que adiciona transação a partir de uma lista vazia
      _items.putIfAbsent(
        id,
        () => TransactionModel(
          id: id,
          title: transaction.title,
          description: transaction.description,
          ammount: transaction.ammount,
          date: transaction.date,
        ),
      );
    }
    // Avisa ao provider que houveram modificações na lista de transações
    notifyListeners();
  }

  void remove(TransactionModel transaction) {
    // Se a lista de transações não estiver vazia e tiver pelo menos um ID instanciado
    if (transaction.id != null) {
      // Remove a transação da lista a partir do ID identificado
      _items.remove(transaction.id);
      notifyListeners();
    }
  }
}