

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/transaction_controller.dart';
import '../components/card_account_balance.dart';
import '../components/drawer.dart';
import '../components/transaction_list_tile.dart';
import '../themes/app_colors.dart';


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
      
      ),
      
      drawer: const DrawerCustom(),
      body: Column(
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.02),
          ),
          const CardAccountBalance(),
          Expanded(
            child: transactions.count == 0 ?
            const Text('Transações fazias')
            :
             ListView.builder(
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
