import 'package:flutter/material.dart';
import 'package:projeto_flutter/controllers/transaction_controller.dart';
import 'package:projeto_flutter/view/components/card_account_balance.dart';
import 'package:projeto_flutter/view/components/list_tile_transaction.dart';
import 'package:projeto_flutter/view/pages/form_transaction.dart';
import 'package:provider/provider.dart';
import '../themes/app_colors.dart';
import '../components/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const home = '/';

  @override
  Widget build(BuildContext context) {
    final TransactionController transactionController = Provider.of(context);
  

    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá, Usuário!'),
        backgroundColor: AppColors.primaryDark,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(
                      FormTransaction.formTransaction,
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
          const CardAccountBalance(),
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.02),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactionController.count,
              itemBuilder: ((cxt, i) =>
              ListTileTransaction(transactionModel: transactionController.byIndex(i))),
            ),
          ),
        ],
      ),
    );
  }
}
