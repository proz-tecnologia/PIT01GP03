import 'package:flutter/material.dart';
import 'package:porkinio/controllers/transaction_controller.dart';
import 'package:porkinio/view/components/account_balance_card.dart';
import 'package:porkinio/view/components/custom_flat_button.dart';
import 'package:porkinio/view/components/custom_navigation_drawer.dart';
import 'package:porkinio/view/components/transaction_list_tile.dart';
import 'package:porkinio/view/themes/app_colors.dart';
import 'package:porkinio/view/themes/app_images.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeHomePage = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá, Usuário!'),
        backgroundColor: AppColors.primaryDark,
      ),
      drawer: const CustomNavigationDrawer(),
      body: Consumer<TransactionController>(
        builder: (context, transactions, chilp) {
          return Column(
            children: [
              SizedBox(
                height: (MediaQuery.of(context).size.height * 0.02),
              ),
              const AccountBalanceCard(),
              Expanded(
                child: transactions.count == 0
                    ? Image.asset(AppImages.porkin)
                    : ListView.builder(
                        itemCount: transactions.count,
                        itemBuilder: (ctx, i) =>
                            TransactionListTile(transactions.byIndex(i)),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
