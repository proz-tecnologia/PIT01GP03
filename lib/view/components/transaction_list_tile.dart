import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:porkinio/controllers/transaction_controller.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/view/components/transaction_form.dart';
import 'package:porkinio/app/common/constants/app_colors.dart';
import 'package:porkinio/app/common/constants/app_images.dart';

class TransactionListTile extends StatelessWidget {
  final TransactionModel transaction;
  final TransactionController transactionController;

  const TransactionListTile({
    Key? key,
    required this.transaction,
    required this.transactionController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: transaction.category!
          ? Image.asset(
              AppImages.wallet,
            )
          : Image.asset(AppImages.withdraw),
      title: Text(transaction.title),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          transaction.category!
              ? Text('+ R\$ ${transaction.ammount.toStringAsFixed(2)}')
              : Text('− R\$ ${transaction.ammount.toStringAsFixed(2)}'),
          Text(DateFormat('dd/MM/yyy').format(transaction.date)),
        ],
      ),
      trailing: SizedBox(
        width: MediaQuery.of(context).size.width * 0.25,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              color: AppColors.primary,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  TransactionForm.routeTransactionForm,
                  arguments: {
                    'category': transaction.category,
                    'controller': transactionController,
                    'transactionModel': transaction,
                  },
                );
              },
            ),
            IconButton(
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
                          transactionController.remove(transaction);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
