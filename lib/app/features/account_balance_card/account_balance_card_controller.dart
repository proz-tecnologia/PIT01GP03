import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:porkinio/locator.dart';

class AccountBalanceCardController extends ChangeNotifier {
  bool visibilityOn = true;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<TransactionModel>> getListTransaction() async {
    final result = await _firestore
        .collection("transactionTest")
        .where("userId", isEqualTo: locator.get<AuthService>().currentUser!.uid)
        .get();

    final resultList = List<TransactionModel>.from(
            result.docs.map((doc) => TransactionModel.fromJson(doc.data())))
        .toList();

    return resultList;
  }

  Future<double> getTotalBalance() async {
    double total = 0.0;
    double totalSum = 0.0;
    double totalSub = 0.0;

    final transactionList = await getListTransaction();

    for (var data in transactionList) {
      if (data.category == true) {
        totalSum += data.ammount;
      }else if (data.category == false){
         totalSub += data.ammount;
      }
      total = totalSum - totalSub;
    }

    notifyListeners();
    return total;
  }

  Future<double> getTotalIncome() async {
    double total = 0.0;

    final transactionList = await getListTransaction();

    for (var data in transactionList) {
      if (data.category == true) {
        total += data.ammount;
      }
    }

    notifyListeners();
    return total;
  }

  Future<double> getTotalExpense() async {
    double total = 0.0;

    final transactionList = await getListTransaction();

    for (var data in transactionList) {
      if (data.category == false) {
        total += data.ammount;
      }
    }

    notifyListeners();
    return total;
  }
}
