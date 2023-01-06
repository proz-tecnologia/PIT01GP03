import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:porkinio/locator.dart';

class AccountBalanceCardController extends ChangeNotifier {
  // TODO: Restaurar lógica de atribuição de valores no AccountBalanceCard

  late Stream<List<TransactionModel>> totalBalance;

  //final List totalIncome = 0;
  //final double totalExpense = 0;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<TransactionModel>> readAllTransactions(String id) => _firestore
      .collection('transactionTest')
      .where('id', isEqualTo: id)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => TransactionModel.fromJson(doc.data()))
          .toList());

  // Future accountBalance() async {
/*
  Future accountBalance() async {
    totalBalance = _firestore
        .collection('transactionsTest')
        .where('id', isEqualTo: locator.get<AuthService>().currentUser!.uid)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TransactionModel.fromJson(doc.data()))
            .toList());
    notifyListeners();
  }

  double totalIncome() {
    double totalSum = 0;
    double totalSubtraction = 0;
    double totalBalance = 0;
    for (TransactionModel value in totalBalance. ) {
      if (value.category == true) {
        totalSum += value.ammount;
      } else if (value.category == false) {
        totalSubtraction += value.ammount;
      }
    }
    totalBalance = totalSum - totalSubtraction;
    return totalBalance;
  }
*/


//
//  final expenseBalance = _firestore
//      .collection('transactionsTest')
//      .where('id', isEqualTo: locator.get<AuthService>().currentUser!.uid)
//      .where("category", isEqualTo: true)
//      .snapshots()
//      .map((snapshot) => snapshot.docs
//          .map((doc) => TransactionModel.fromJson(doc.data()))
//          .toList());
  // }

  bool visibilityOn = true;
}

/*
  double totalBalance() {
    double totalSum = 0;
    double totalSubtraction = 0;
    double totalBalance = 0;
    for (TransactionModel value in ) {
      if (value.category == true) {
        totalSum += value.ammount;
      } else if (value.category == false) {
        totalSubtraction += value.ammount;
      }
    }
    totalBalance = totalSum - totalSubtraction;
    return totalBalance;
  }

  double sumBalance() {
    double total = 0;
    for (TransactionModel value in ) {
      if (value.category == true) {
        total += value.ammount;
      }
    }
    return total;
  }

  double subtractBalance() {
    double total = 0;
    for (TransactionModel value in ) {
      if (value.category == false) {
        total -= value.ammount;
      }
    }
    return total;
  }
*/
 // bool visibilityOn = true;
//}
