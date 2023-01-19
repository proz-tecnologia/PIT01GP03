import 'package:flutter/material.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/features/goals_card/goals_card.dart';
import 'package:porkinio/app/features/goals_card/goals_card_controller.dart';
import 'package:porkinio/app/features/home/background_header.dart';
import 'package:porkinio/app/features/home/custom_floating_action_button.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_card.dart';
import 'package:porkinio/app/features/account_balance_card/account_balance_card.dart';
import 'package:porkinio/app/common/widgets/custom_navigation_drawer.dart';
import 'package:porkinio/app/features/account_balance_card/account_balance_card_controller.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_controller.dart';
import 'package:porkinio/app/features/splash/splash_page.dart';
import 'package:porkinio/app/services/auth_service.dart';
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
  final goalsCardController = locator.get<GoalsCardController>();
  final accountBalanceCardController =
      locator.get<AccountBalanceCardController>();
  final _secureStorage = const SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Olá, ${locator.get<AuthService>().currentUser?.displayName}!',
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              _secureStorage.deleteOne(key: "CURRENT_USER").then(
                    (_) => Navigator.popAndPushNamed(
                      context,
                      SplashPage.route,
                    ),
                  );
            },
          )
        ],
      ),
      drawer: const CustomNavigationDrawer(),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            const BackgroundHeader(),
            ListView(
              children: [
                const AccountBalanceCard(),
                TransactionListCard(
                  transactionListController: transactionListController,
                ),
                Stack(
                  children: [
                    SingleChildScrollView(
                      clipBehavior: Clip.antiAlias,
                      scrollDirection: Axis.horizontal,
                      child: GoalsCard(
                        goalsCardController: goalsCardController,
                      ),
                    ),
                    Positioned(
                      // FADE ESQUERDO
                      left: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Colors.white.withOpacity(0.0),
                              Colors.white,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // FADE DIREITO
                      right: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.white.withOpacity(0.0),
                              Colors.white,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              // FADE SUPERIOR
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.01,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primaryDark,
                      AppColors.primaryDark.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        transactionListController: transactionListController,
        goalsCardController: goalsCardController,
      ),
    );
  }
}
