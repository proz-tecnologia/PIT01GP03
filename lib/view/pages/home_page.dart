import 'package:flutter/material.dart';
import 'package:porkinio/app/common/widgets/account_balance_card.dart';
import 'package:porkinio/app/common/widgets/custom_navigation_drawer.dart';
import 'package:porkinio/app/common/widgets/transaction_list_tile.dart';
import 'package:porkinio/app/features/home/home_controller.dart';
import 'package:porkinio/app/common/constants/app_colors.dart';
import 'package:porkinio/app/common/constants/app_images.dart';
import 'package:porkinio/app/models/transaction_model.dart';

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
      
      drawer: 
      const CustomNavigationDrawer(),
      body: 
      
        Column(
          
      
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.02),
          ),
          AccountBalanceCard(
            transactionController: transactions,
          ),
          Expanded(
         
            child: AnimatedBuilder(animation: transactions, builder: (context, child) => 
            transactions.items.length == 0
                ? Image.asset(AppImages.porkin)
                : AnimatedBuilder(
                    animation: transactions,
                    builder: (context, _) {
                      return ListView.builder(
                        itemCount: transactions.items.length,
                        itemBuilder: (ctx, i) => TransactionListTile(
                          transactionController: transactions,
                          transactionModel: transactions.items.elementAt(i),
                        ),
                      );
                    },
                  ),
          ),
      )],
      ),
      );
  }
}
