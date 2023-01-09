import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/features/account_balance_card/account_balance_card_state.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:porkinio/locator.dart';

class AccountBalanceCardController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  AccountBalanceCardState _accountBalanceCardState =
      AccountBalanceCardInitialState();
  AccountBalanceCardState get state => _accountBalanceCardState;

  late double totalBalance = 0.0;
  late double totalIncome = 0.0;
  late double totalExpenses = 0.0;

  void _updateState(AccountBalanceCardState newState) {
    _accountBalanceCardState = newState;
    notifyListeners();
  }

  Future<List<TransactionModel>> readTransactionList() async {
    final snapshot = await _firestore
        .collection("transactionDB")
        .where("userId", isEqualTo: locator.get<AuthService>().currentUser!.uid)
        .get();

    final transactionList = List<TransactionModel>.from(
            snapshot.docs.map((doc) => TransactionModel.fromJson(doc.data())))
        .toList();

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

  //  notifyListeners();
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

 //   notifyListeners();
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
    _updateState(AccountBalanceCardSuccessState());
    return totalBalance;
  }
}
