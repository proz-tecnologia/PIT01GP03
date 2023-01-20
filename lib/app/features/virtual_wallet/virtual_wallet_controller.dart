import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/features/virtual_wallet/virtual_wallet_card_state.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:porkinio/locator.dart';

class VirtualWalletController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  VirtualWalletCardState _virtualWalletCardState =
      VirtualWalletCardInitialState();
  VirtualWalletCardState get state => _virtualWalletCardState;

  double totalBalance = 0.0;
  double totalIncome = 0.0;
  double totalExpenses = 0.0;

  void _updateState(VirtualWalletCardState newState) {
    _virtualWalletCardState = newState;
    notifyListeners();
  }

  Future<List<TransactionModel>> readTransactionList() async {
    final snapshot = await _firestore
        .collection("transactions")
        .where("userId", isEqualTo: locator.get<AuthService>().currentUser?.uid)
        .get();

    final transactionList = List<TransactionModel>.from(
      snapshot.docs.map(
        (doc) => TransactionModel.fromJson(
          doc.data(),
        ),
      ),
    ).toList();

    return transactionList;
  }

  Future<double> getIncomeBalance() async {
    totalIncome = 0.0;
    final transactionList = await readTransactionList();

    for (var transaction in transactionList) {
      if (transaction.category == true) {
        totalIncome += transaction.amount;
      }
    }

    return totalIncome;
  }

  Future<double> getExpensesBalance() async {
    totalExpenses = 0.0;
    final transactionList = await readTransactionList();

    for (var transaction in transactionList) {
      if (transaction.category == false) {
        totalExpenses += transaction.amount;
      }
    }

    return totalExpenses;
  }

  Future<double> getTotalBalance() async {
    totalBalance = 0.0;
    double income = 0.0;
    double expenses = 0.0;
    final transactionList = await readTransactionList();

    for (var transaction in transactionList) {
      if (transaction.category == true) {
        income += transaction.amount;
      }
      if (transaction.category == false) {
        expenses += transaction.amount;
      }
    }
    totalBalance = income - expenses;

    _updateState(
      VirtualWalletCardSuccessState(),
    );

    return totalBalance;
  }
}
