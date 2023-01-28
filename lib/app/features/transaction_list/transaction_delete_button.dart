import 'package:flutter/material.dart';
import 'package:porkinio/app/features/home/home_page.dart';
import 'package:porkinio/app/features/transaction_list/transaction_controller.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/locator.dart';

class TransactionDeleteButton extends StatefulWidget {
  final TransactionModel transactionModel;

  const TransactionDeleteButton({
    Key? key,
    required this.transactionModel,
  }) : super(key: key);

  static const route = '/home-page';

  @override
  State<TransactionDeleteButton> createState() =>
      _TransactionDeleteButtonState();
}

class _TransactionDeleteButtonState extends State<TransactionDeleteButton> {
  final transactionController = locator.get<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Deseja excluir essa transação?'),
            content: Text(
              'Essa ação não poderá ser desfeita.',
              style: Theme.of(context).textTheme.overline?.copyWith(
                    color: Colors.redAccent,
                  ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.grey,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancelar'),
                    ),
                    ElevatedButton(
                      child: const Text('Confirmar'),
                      onPressed: () async {
                        Navigator.of(context)
                            .pushReplacementNamed(HomePage.route);
                        await transactionController
                            .deleteTransaction(widget.transactionModel);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
