import 'package:porkinio/app/features/home/transaction_list_controller.dart';
import 'package:porkinio/app/models/transaction_model.dart';


class AccountBalanceCardController extends TransactionListController {
  final transactions = TransactionListController().transactionList;
  // TODO: PAULO: Restaurar lógica de atribuição de valores no AccountBalanceCard a partir da lista do TransactionListController


  double totalBalance() {
    double totalSum = 0;
    double totalSubtraction = 0;
    double totalBalance = 0;
    for (TransactionModel value in transactions) {
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
    for (TransactionModel value in transactions) {
      if (value.category == true) {
        total += value.ammount;
      }
    }
    return total;
  }

  double subtractBalance() {
    double total = 0;
    for (TransactionModel value in transactions) {
      if (value.category == false) {
        total -= value.ammount;
      }
    }
    return total;
  }

  bool visibilityOn = true;
}


// TODO: CHARLESTON: Incrementar FOR EACH e WHERE