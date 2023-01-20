import 'package:flutter/material.dart';
import 'package:porkinio/app/features/transaction_list/transaction_form.dart';
import 'package:porkinio/app/features/transaction_list/transaction_controller.dart';
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
  final transactionController = locator.get<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => Center(
            child: TransactionForm(
              controller: transactionController,
              model: widget.transactionModel,
            ),
          ),
        );
      },
    );
  }
}
