import 'package:porkinio/app/features/transaction_list/transaction_list_controller.dart';
import 'package:porkinio/app/models/transaction_model.dart';
class AccountBalanceCardController {
  final transactionsListController = TransactionListController();
  // TODO: Restaurar lógica de atribuição de valores no AccountBalanceCard

  double totalBalance() {
    double totalSum = 0;
    double totalSubtraction = 0;
    double totalBalance = 0;
    for (TransactionModel value in transactionsListController.transactionList) {
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
    for (TransactionModel value in transactionsListController.transactionList) {
      if (value.category == true) {
        total += value.ammount;
      }
    }
    return total;
  }

  double subtractBalance() {
    double total = 0;
    for (TransactionModel value in transactionsListController.transactionList) {
      if (value.category == false) {
        total -= value.ammount;
      }
    }
    return total;
  }

  bool visibilityOn = true;
}
