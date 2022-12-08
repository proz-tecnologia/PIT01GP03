import 'package:flutter/material.dart';
import 'package:porkinio/controllers/transaction_controller.dart';
import 'package:porkinio/view/components/account_balance_card.dart';
import 'package:porkinio/view/components/custom_navigation_drawer.dart';
import 'package:porkinio/view/components/transaction_list_tile.dart';
import 'package:porkinio/app/common/constants/app_colors.dart';
import 'package:porkinio/app/common/constants/app_images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeHomePage = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final transactions = TransactionController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá, Usuário!'),
        backgroundColor: AppColors.primaryDark,
      ),
      drawer: const CustomNavigationDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.02),
          ),
          AccountBalanceCard(
            transactionController: transactions,
          ),
          Expanded(
            child: transactions.count == 0
                ? Image.asset(AppImages.porkin)
                : AnimatedBuilder(
                    animation: transactions,
                    builder: (context, _) {
                      return ListView.builder(
                        itemCount: transactions.count,
                        itemBuilder: (ctx, i) => TransactionListTile(
                          transactionController: transactions,
                          transaction: transactions.byIndex(i),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
