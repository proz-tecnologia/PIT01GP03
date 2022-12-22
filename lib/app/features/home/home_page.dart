import 'package:flutter/material.dart';
import 'package:porkinio/app/common/widgets/transaction_form.dart';
import 'package:porkinio/app/features/home/home_controller.dart';
import 'package:porkinio/app/common/widgets/account_balance_card.dart';
import 'package:porkinio/app/common/widgets/custom_navigation_drawer.dart';
import 'package:porkinio/app/common/widgets/transaction_list_tile.dart';
import 'package:porkinio/app/common/constants/app_colors.dart';
import 'package:porkinio/app/common/constants/app_images.dart';
import 'package:porkinio/app/features/splash/splash_page.dart';
import 'package:porkinio/app/services/secure_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeHomePage = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final transactionsController = TransactionController();
  final _secureStorage = const SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá, Usuário!'),
        backgroundColor: AppColors.primaryDark,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),

            //TODO DEFINIR ONDE ESSA FUNCAO DE MATAR SECAO DEVE FICAR NA TELA HOME 
            onPressed: () {
              _secureStorage.deleteOne(key: "CURRENT_USER").then((_) => 
              Navigator.popAndPushNamed(context, SplashPage.routSplashPage));
            },
          )
        ],
      ),
      drawer: const CustomNavigationDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.02),
          ),
          AnimatedBuilder(
              animation: transactionsController,
              builder: (context, child) {
                return AccountBalanceCard(
                  transactionController: transactionsController,
                );
              }),
          Expanded(
            child: AnimatedBuilder(
                animation: transactionsController,
                builder: (context, child) {
                  return transactionsController.items.isEmpty
                      ? Image.asset(AppImages.porkin)
                      : ListView.builder(
                          itemCount: transactionsController.items.length,
                          itemBuilder: (ctx, i) => TransactionListTile(
                            transactionController: transactionsController,
                            transactionModel: transactionsController.items[i],
                          ),
                        );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: TransactionForm(
                transactionController: transactionsController,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
