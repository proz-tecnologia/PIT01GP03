import 'package:flutter/material.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_controller.dart';
import 'package:porkinio/app/models/transaction_model.dart';

class TransactionDeleteButton extends StatefulWidget {
  final TransactionModel transactionModel;

  const TransactionDeleteButton({
    Key? key,
    required this.transactionModel,
  }) : super(key: key);

  @override
  State<TransactionDeleteButton> createState() =>
      _TransactionDeleteButtonState();
}

class _TransactionDeleteButtonState extends State<TransactionDeleteButton> {
  final transactionListController = TransactionListController();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      color: AppColors.errorColor,
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Você deseja excluir essa transação'),
            content: const Text('Tem certeza?'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Não'),
              ),
              ElevatedButton(
                child: const Text('Sim'),
                onPressed: () {
                  transactionListController
                      .deleteTransaction(widget.transactionModel);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
