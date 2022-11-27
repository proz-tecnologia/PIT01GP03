

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/transaction_controller.dart';
import '../../models/transaction_model.dart';
import '../components/card_account_balance.dart';
import '../components/drawer.dart';
import '../components/transaction_list_tile.dart';
import '../components/transaction_form.dart';
import '../themes/app_colors.dart';
import 'form_transaction.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeHomePage = '/';

  @override
  Widget build(BuildContext context) {
    final TransactionController transactions = Provider.of(context);
  

    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá, Usuário!'),
        backgroundColor: AppColors.primaryDark,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                TransactionForm.routeTransactionForm,
                arguments: TransactionModel(
                  id: '',
                  title: '',
                  description: '',
                  ammount: 0,
                  date: DateTime.now(),
                  // TODO: implementar validação do formulário com os campos de ammount e date em branco
                ),
              );
/*
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      content: FormTransaction(),
                    );
                  },
                );
                */
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: const DrawerCustom(),
      body: Column(
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.02),
          ),
          const CardAccountBalance(),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.count,
              itemBuilder: (ctx, i) =>
                  TransactionListTile(transactions.byIndex(i)),
            ),
          ),
        ],
      ),
    );
  }
}
