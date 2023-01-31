import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/features/virtual_wallet/virtual_wallet_card_state.dart';
import 'package:porkinio/app/features/virtual_wallet/virtual_wallet_model.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:porkinio/locator.dart';

class VirtualWalletController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  VirtualWalletCardState _virtualWalletCardState =
      VirtualWalletCardInitialState();
  VirtualWalletCardState get state => _virtualWalletCardState;

  double walletBalance = 0.0;

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

  Future getIncome(VirtualWalletModel wallet) async {
    await getBalance(wallet);
    final queryIncome = _firestore
        .collection('wallet')
        .doc('${locator.get<AuthService>().currentUser!.uid}/income');
    final snapshotIncome = await queryIncome.get();

    if (snapshotIncome.exists) {
      wallet.income = snapshotIncome.data()?.entries.first.value;
    }
  }

  Future getExpenses(VirtualWalletModel wallet) async {
    await getBalance(wallet);
    final queryExpenses = _firestore
        .collection('wallet')
        .doc('${locator.get<AuthService>().currentUser!.uid}/expenses');
    final snapshotExpenses = await queryExpenses.get();

    if (snapshotExpenses.exists) {
      wallet.income = snapshotExpenses.data()?.entries.first.value;
    }
  }

  Future<double> getBalance(VirtualWalletModel wallet) async {
    walletBalance = 0.0;
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
    walletBalance = income - expenses;

    final newWallet = _firestore
        .collection('wallet')
        .doc(locator.get<AuthService>().currentUser!.uid);
    wallet.id = newWallet.id;
    wallet.balance = walletBalance;
    wallet.income = income;
    wallet.expenses = expenses;
    wallet.userId = locator.get<AuthService>().currentUser!.uid;
    await newWallet.set(wallet.toJson());

    _updateState(
      VirtualWalletCardSuccessState(),
    );

    return walletBalance;
  }

  // Future updateWallet(VirtualWalletModel wallet) async {
  //   final newBalance = await getBalance();
  //   final newIncome = await getIncome();
  //   final newExpenses = await getExpenses();
  //   final newWallet = _firestore
  //       .collection('wallet')
  //       .doc(locator.get<AuthService>().currentUser!.uid);
  //   wallet.id = newWallet.id;
  //   wallet.balance = newBalance;
  //   wallet.income = newIncome;
  //   wallet.expenses = newExpenses;
  //   wallet.userId = locator.get<AuthService>().currentUser!.uid;
  //   await newWallet.set(wallet.toJson());
  //   _updateState(
  //     VirtualWalletCardSuccessState(),
  //   );
  // }
}
