// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:porkinio/app/common/constants/app_colors.dart';
import 'package:porkinio/app/features/transaction_list/transaction_form.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_controller.dart';
import 'package:porkinio/app/models/transaction_model.dart';

class TransactionEditButton extends StatefulWidget {
  final TransactionModel transactionModel;
  final TransactionListController transactionListController;
  const TransactionEditButton({
    Key? key,
    required this.transactionModel,
    required this.transactionListController,
  }) : super(key: key);
  

  @override
  State<TransactionEditButton> createState() => _TransactionEditButtonState();
}

class _TransactionEditButtonState extends State<TransactionEditButton> {


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      color: AppColors.primary,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => Center(
            child: TransactionForm(
              transactionListController: widget.transactionListController,
              transactionModel: widget.transactionModel,
            ),
          ),
        );
      },
    );
  }
}
