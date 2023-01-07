import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/features/transaction_list/transaction_delete_button.dart';
import 'package:porkinio/app/features/transaction_list/transaction_edit_button.dart';
import 'package:porkinio/app/models/transaction_model.dart';

//TODO TIRAR TAMANHOS FIXOS

Widget buildTransactionList(TransactionModel transactionModel) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.backgroundLight,
        child: ListTile(
          style: ListTileStyle.drawer,
          leading: transactionModel.category
              ? const Icon(
                  Icons.savings,
                  size: 32,
                  color: AppColors.primaryLight,
                )
              : const Icon(
                  Icons.paid,
                  size: 32,
                  color: AppColors.secondaryLight,
                ),
          title: Text(transactionModel.title),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              transactionModel.category
                  ? Text('+ R\$ ${transactionModel.amount.toStringAsFixed(2)}')
                  : Text('− R\$ ${transactionModel.amount.toStringAsFixed(2)}'),
              Text(DateFormat('dd/MM/yyy').format(transactionModel.date)),
            ],
          ),
          trailing: SizedBox(
            width: 96,
            child: Row(
              children: <Widget>[
                TransactionEditButton(transactionModel: transactionModel),
                TransactionDeleteButton(transactionModel: transactionModel),
              ],
            ),
          ),
        ),
      ),
    );
