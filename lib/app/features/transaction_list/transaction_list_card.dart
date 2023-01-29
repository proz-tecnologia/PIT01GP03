import 'package:flutter/material.dart';
import 'package:porkinio/app/features/transaction_list/transaction_controller.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_tile.dart';
import 'package:porkinio/app/models/transaction_model.dart';

class TransactionListCard extends StatelessWidget {
  const TransactionListCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TransactionController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height,
      height: MediaQuery.of(context).size.height * 0.42,
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        child: StreamBuilder<List<TransactionModel>>(
          stream: controller.readAllTransactions(),
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
                child: Scrollbar(
                  child: ListView(
                    children: snapshot.data!
                        .map(
                          (model) => TransactionListTile(
                            model: model,
                            controller: controller,
                          ),
                        )
                        .toList(),
                  ),
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
