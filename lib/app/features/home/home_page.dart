import 'package:flutter/material.dart';
import 'package:porkinio/app/features/home/background_header.dart';
import 'package:porkinio/app/features/home/custom_floating_action_button.dart';
import 'package:porkinio/app/features/home/transaction_list_card.dart';
import 'package:porkinio/app/features/account_balance_card/account_balance_card.dart';
import 'package:porkinio/app/common/widgets/custom_navigation_drawer.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/features/account_balance_card/account_balance_card_controller.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_controller.dart';
import 'package:porkinio/app/features/splash/splash_page.dart';
import 'package:porkinio/app/services/secure_storage.dart';
import 'package:porkinio/locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const route = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final transactionListController = locator.get<TransactionListController>();
  final accountBalanceCardController =
      locator.get<AccountBalanceCardController>();
  final _secureStorage = const SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá, Usuário!'),
        // backgroundColor: AppColors.primaryDark,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              _secureStorage.deleteOne(key: "CURRENT_USER").then(
                  (_) => Navigator.popAndPushNamed(context, SplashPage.route));
            },
          )
        ],
      ),
      drawer: const CustomNavigationDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: const [
              BackgroundHeader(),
              AccountBalanceCard(),
            ],
          ),
          TransactionListCard(
            transactionListController: transactionListController,
          ),
          const SizedBox(height: 108),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActionButton(
          transactionListController: transactionListController),
    );
  }
}
