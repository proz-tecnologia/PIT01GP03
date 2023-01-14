import 'package:flutter/material.dart';
import 'package:porkinio/app/features/transaction_list/transaction_form.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_controller.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/locator.dart';

class TransactionEditButton extends StatefulWidget {
  final TransactionModel transactionModel;
  const TransactionEditButton({
    Key? key,
    required this.transactionModel,
  }) : super(key: key);

  static const route = '/home-page';

  @override
  State<TransactionEditButton> createState() => _TransactionEditButtonState();
}

class _TransactionEditButtonState extends State<TransactionEditButton> {
  final transactionListController = locator.get<TransactionListController>();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => Center(
            child: TransactionForm(
              transactionListController: transactionListController,
              transactionModel: widget.transactionModel,
            ),
          ),
        );
      },
    );
  }
}
