import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/common/themes/app_images.dart';
import 'package:porkinio/app/features/home/home_controller.dart';
import 'package:porkinio/app/features/transaction_list/transaction_form.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_controller.dart';
import 'package:porkinio/app/models/transaction_model.dart';

class TransactionListTile extends StatelessWidget {
  final TransactionModel transactionModel;
  final TransactionListController transactionController;

  const TransactionListTile({
    Key? key,
    required this.transactionModel,
    required this.transactionController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: transactionModel.category
          ? Image.asset(
              AppImages.waiting,
            )
          : Image.asset(AppImages.porkin),
      title: Text(transactionModel.title),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          transactionModel.category
              ? Text('+ R\$ ${transactionModel.ammount.toStringAsFixed(2)}')
              : Text('− R\$ ${transactionModel.ammount.toStringAsFixed(2)}'),
          Text(DateFormat('dd/MM/yyy').format(transactionModel.date)),
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
                showDialog(
                  context: context,
                  builder: (context) => Center(
                    child: TransactionForm(
                      transactionListController: transactionController,
                      transactionModel: transactionModel,
                    ),
                  ),
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
                        // transactionController.remove(transactionModel);
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