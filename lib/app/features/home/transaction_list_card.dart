import 'package:flutter/material.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/features/transaction_list/build_transaction_list.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_controller.dart';
import 'package:porkinio/app/models/transaction_model.dart';

class TransactionListCard extends StatelessWidget {
  const TransactionListCard({
    Key? key,
    required this.transactionListController,
  }) : super(key: key);

  final TransactionListController transactionListController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          // color: AppColors.primary,
          child: StreamBuilder<List<TransactionModel>>(
            stream: transactionListController.readAllTransactions(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Encontramos um erro: "${snapshot.error}"');
              } else if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: ListView(
                    children:
                        snapshot.data!.map(buildTransactionList).toList(),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}