import 'package:flutter/material.dart';
import 'package:porkinio/app/features/transaction_list/transaction_form.dart';
import 'package:porkinio/app/features/account_balance_card/account_balance_card.dart';
import 'package:porkinio/app/common/widgets/custom_navigation_drawer.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_tile.dart';
import 'package:porkinio/app/common/constants/app_colors.dart';
import 'package:porkinio/app/common/constants/app_images.dart';
import 'package:porkinio/app/features/account_balance_card/account_balance_card_controller.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_controller.dart';
import 'package:porkinio/app/features/splash/splash_page.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/app/services/secure_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeHomePage = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final transactionListController = TransactionListController();
  final accountBalanceCardController = AccountBalanceCardController();
  final _secureStorage = const SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá, Usuário!'),
        backgroundColor: AppColors.primaryDark,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),

            //TODO DEFINIR ONDE ESSA FUNCAO DE MATAR SECAO DEVE FICAR NA TELA HOME
            onPressed: () {
              _secureStorage.deleteOne(key: "CURRENT_USER").then((_) =>
                  Navigator.popAndPushNamed(
                      context, SplashPage.routSplashPage));
            },
          )
        ],
      ),
      drawer: const CustomNavigationDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
              animation: transactionListController,
              builder: (context, child) {
                return AccountBalanceCard(
                  accountBalanceCardController: accountBalanceCardController,
                );
              }),
          Expanded(
            child: StreamBuilder<List<TransactionModel>>(
              stream: transactionListController.readTransactions(),
              builder: (context, child) {
                return transactionListController.transactionList.isEmpty
                    ? Image.asset(AppImages.porkin)
                    : ListView.builder(
                        itemCount:
                            transactionListController.transactionList.length,
                        itemBuilder: (ctx, i) => TransactionListTile(
                          transactionListController: transactionListController,
                          transactionModel:
                              transactionListController.transactionList[i],
                        ),
                      );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: TransactionForm(
                transactionListController: transactionListController,
              ),
            ),
          );
        },
        icon: const Icon(Icons.receipt_long),
        label: const Text("Cadastrar Transação"),
        elevation: 5,
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
