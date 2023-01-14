import 'package:flutter/material.dart';
import 'package:porkinio/app/features/transaction_list/transaction_form.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_controller.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    Key? key,
    required this.transactionListController,
  }) : super(key: key);

  final TransactionListController transactionListController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => Center(
            child: TransactionForm(
              transactionListController: transactionListController,
            ),
          ),
        );
      },
      icon: const Icon(Icons.receipt_long),
      label: const Text("Cadastrar Transação"),
      elevation: 10,
    );
  }
}
