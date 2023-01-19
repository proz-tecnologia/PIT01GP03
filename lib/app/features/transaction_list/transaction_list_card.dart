import 'package:flutter/material.dart';
import 'package:porkinio/app/features/transaction_list/build_transaction_list.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_controller.dart';
import 'package:porkinio/app/models/transaction_model.dart';

class TransactionListCard extends StatelessWidget {
  const TransactionListCard({
    Key? key,
    required this.transactionListController,
  }) : super(key: key);

  final TransactionListController
      transactionListController; // TODO: REVER SE USA O LOCATOR

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        child: StreamBuilder<List<TransactionModel>>(
          stream: transactionListController.readAllTransactions(),
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  'Sem transações cadastradas',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              );
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: ListView(
                  children: snapshot.data!
                      .map((model) => TransactionItem(transactionModel: model))
                      .toList(),
                ),
              );
            } else {
              return Text('Encontramos um erro: "${snapshot.error}"');
            }
          },
        ),
      ),
    );
  }
}
