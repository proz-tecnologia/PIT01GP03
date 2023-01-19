import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:porkinio/app/features/transaction_list/transaction_delete_button.dart';
import 'package:porkinio/app/features/transaction_list/transaction_edit_button.dart';
import 'package:porkinio/app/models/transaction_model.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transactionModel,
  }) : super(key: key);

  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        child: ListTile(
          style: ListTileStyle.drawer,
          leading: transactionModel.category
              ? const Icon(
                  Icons.savings,
                  size: 32,
                )
              : const Icon(
                  Icons.paid,
                  size: 32,
                ),
          title: Text(
            transactionModel.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              transactionModel.category
                  ? Text(
                      '+ R\$ ${transactionModel.amount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.teal,
                      ),
                    )
                  : Text(
                      '− R\$ ${transactionModel.amount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.redAccent,
                      ),
                    ),
              Text(
                DateFormat('dd/MM/yyy').format(transactionModel.date),
              ),
            ],
          ),
          trailing: SizedBox(
            width: 96,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TransactionEditButton(transactionModel: transactionModel),
                TransactionDeleteButton(transactionModel: transactionModel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
