import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:porkinio/view/components/transaction_form.dart';
import 'package:porkinio/view/themes/app_colors.dart';
import 'package:porkinio/view/themes/app_images.dart';
import 'package:provider/provider.dart';

import '../../controllers/transaction_controller.dart';
import '../../models/transaction_model.dart';

class TransactionListTile extends StatelessWidget {
  const TransactionListTile(this.transaction, {super.key});

  // Variável transaction que segue o padrão TransactionModel
  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    // Variável avatar que recebe o padrão do TransactionModel
    // Condição ternária: se for nula ou vazia, utilizar o ícone Icons.person

    return ListTile(
      // explicação: pelo transaction.category já sei se é entrada ou saida, faço o if ternario para escolher a imagem que ja pego direto da nossa pasta de imagens

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
                  arguments: transaction,
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
                          Provider.of<TransactionController>(context,
                                  listen: false)
                              .remove(transaction);
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
