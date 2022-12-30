import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_controller.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/app/features/transaction_list/transaction_form.dart';
import 'package:porkinio/app/common/constants/app_colors.dart';

//TODO DELETAR

class TransactionListTile extends StatelessWidget {
  final TransactionModel transactionModel;
  final TransactionListController transactionListController;

  const TransactionListTile({
    Key? key,
    required this.transactionModel,
    required this.transactionListController,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Column(
        children: [
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            color: AppColors.backgroundLight,
            child: ListTile(
              leading: transactionModel.category
                  ? const Icon(
                      Icons.savings,
                      size: 40,
                      color: AppColors.primaryLight,
                    )
                  : const Icon(
                      Icons.paid,
                      size: 40,
                      color: AppColors.secondaryLight,
                    ),
              title: Text(transactionModel.title),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  transactionModel.category
                      ? Text(
                          '+ R\$ ${transactionModel.ammount.toStringAsFixed(2)}')
                      : Text(
                          '− R\$ ${transactionModel.ammount.toStringAsFixed(2)}'),
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
                              transactionListController:
                                  transactionListController,
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
                            title: const Text(
                                'Você deseja excluir essa transação'),
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
                                      .removeTransaction(transactionModel);
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
            ),
          ),
        ],
      ),
    );
  }
}
