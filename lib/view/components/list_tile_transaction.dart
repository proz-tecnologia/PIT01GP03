import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_flutter/controllers/transaction_controller.dart';

import 'package:projeto_flutter/models/transaction_model.dart';
import 'package:projeto_flutter/view/pages/form_transaction.dart';
import 'package:provider/provider.dart';

class ListTileTransaction extends StatelessWidget {
  
  const ListTileTransaction({
    Key? key,
    required this.transactionModel,
  }) : super(key: key);

  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(transactionModel.iconUrl!),
      ),
      title: Text(transactionModel.name),
      subtitle: Row(
        children: [
          Text(transactionModel.value.toString()),
          const SizedBox(width: 8),
          Text(DateFormat('d MMM y').format(transactionModel.date)),
        ],
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  FormTransaction.formTransaction,
                  arguments: transactionModel,
                );
              },
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Excluir dados'),
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
                          Provider.of<TransactionController>(ctx, listen: false)
                              .remover(transactionModel);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
