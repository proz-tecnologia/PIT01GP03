import 'package:flutter/material.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_card_list.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_controller.dart';
import 'package:porkinio/app/features/home/background_header.dart';
import 'package:porkinio/app/features/home/custom_floating_action_button.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_card.dart';
import 'package:porkinio/app/features/virtual_wallet/virtual_wallet_card.dart';
import 'package:porkinio/app/common/widgets/custom_navigation_drawer.dart';
import 'package:porkinio/app/features/virtual_wallet/virtual_wallet_controller.dart';
import 'package:porkinio/app/features/transaction_list/transaction_controller.dart';
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
  final transactionController = locator.get<TransactionController>();
  final piggyBankController = locator.get<PiggyBankController>();
  final virtualWalletCardController = locator.get<VirtualWalletController>();
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
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Deseja sair desta conta?'),
                  content: Text(
                    'Os seus dados continuarão salvos na núvem e você será direcionado novamente à página de Login.',
                    style: Theme.of(context).textTheme.overline?.copyWith(
                          color: Colors.teal[800],
                        ),
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.grey,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancelar'),
                          ),
                          ElevatedButton(
                            child: const Text('Confirmar'),
                            onPressed: () async {
                              _secureStorage
                                  .deleteOne(key: "CURRENT_USER")
                                  .then(
                                    (_) => Navigator.popAndPushNamed(
                                      context,
                                      SplashPage.route,
                                    ),
                                  );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
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
            ListView(
              children: [
                Stack(
                  children: const [
                    BackgroundHeader(),
                    VirtualWalletCard(),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      children: <Widget>[
                        const Expanded(
                          child: Divider(),
                        ),
                        Text(
                          "  Minhas Transações  ",
                          style: Theme.of(context).textTheme.overline?.copyWith(
                                color: Colors.grey,
                                fontSize: 8,
                              ),
                        ),
                        const Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),
                  ),
                ),
                TransactionListCard(
                  controller: transactionController,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      children: <Widget>[
                        const Expanded(
                          child: Divider(),
                        ),
                        Text(
                          "  Meus Porkinios  ",
                          style: Theme.of(context).textTheme.overline?.copyWith(
                                color: Colors.grey,
                                fontSize: 8,
                              ),
                        ),
                        const Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    SingleChildScrollView(
                      clipBehavior: Clip.antiAlias,
                      scrollDirection: Axis.horizontal,
                      child: PiggyBankCardList(
                        controller: piggyBankController,
                        walletController: virtualWalletCardController,
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
                              Colors.white.withOpacity(0.5),
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
                              Colors.white.withOpacity(0.5),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                )
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
                      AppColors.primaryDark.withOpacity(0.5),
                      AppColors.primaryDark.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              // FADE INFERIOR
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        transactionController: transactionController,
        piggyBankController: piggyBankController,
      ),
    );
  }
}
