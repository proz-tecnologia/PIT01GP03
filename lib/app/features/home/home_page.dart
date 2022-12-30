import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:porkinio/app/features/transaction_list/transaction_delete_button.dart';
import 'package:porkinio/app/features/transaction_list/transaction_edit_button.dart';
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
  // final TransactionModel transactionModel;
  final accountBalanceCardController = AccountBalanceCardController();
  final _secureStorage = const SecureStorage();

  Widget buildTransactionList(TransactionModel transaction) => ListTile(
      leading: transaction.category
          ? const Icon(
              Icons.savings,
              size: 40,
              color: AppColors.primaryLight,
            )
          : const Icon(
              Icons.paid,
              size: 40,
              color: AppColors.secondaryLight,
            ),
      title: Text(transaction.title),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          transaction.category
              ? Text('+ R\$ ${transaction.ammount.toStringAsFixed(2)}')
              : Text('− R\$ ${transaction.ammount.toStringAsFixed(2)}'),
          Text(DateFormat('dd/MM/yyy').format(transaction.date)),
        ],
      ),
      trailing: SizedBox(
        width: 120,
        child: Row(
          children: <Widget>[
            // TransactionEditButton(transactionListController: transactionListController, transactionModel: transactionModel,),
            // TransactionDeleteButton(transactionListController: transactionListController, transactionModel: transactionModel,),
          ],
        ),
      ),
    );

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
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Encontramos um erro: "${snapshot.error}"');
                  } else if (snapshot.hasData) {
                    return ListView(
                      children:
                          snapshot.data!.map(buildTransactionList).toList(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }
                // builder: (context, child) {
                //   return transactionListController.transactionList.isEmpty
                //       ? Image.asset(AppImages.porkin)
                // : ListView.builder(
                //     itemCount:
                //         transactionListController.transactionList.length,
                //     itemBuilder: (ctx, i) => TransactionListTile(
                //       transactionListController: transactionListController,
                //       transactionModel:
                //           transactionListController.transactionList[i],
                //     ),
                //   );
                // },
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
