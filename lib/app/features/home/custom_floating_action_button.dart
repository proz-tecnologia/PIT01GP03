import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/features/transaction_list/transaction_form.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_controller.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    Key? key,
    required this.transactionListController,
  }) : super(key: key);

  final TransactionListController transactionListController; // TODO: REVER SE USA O LOCATOR

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.receipt_long, color: Colors.white),
          label: 'Cadastrar nova transação',
          labelStyle: Theme.of(context).textTheme.button,
          backgroundColor: AppColors.primary,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: TransactionForm(
                  transactionListController: transactionListController,
                ),
              ),
            );
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.savings_sharp, color: Colors.white),
          label: 'Cadastrar novo Porkinio',
          labelStyle: Theme.of(context).textTheme.button,
          backgroundColor: AppColors.primary,
          onTap: () {},
        ),
      ],
    );
  }
}
