import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/common/themes/app_images.dart';
import 'package:porkinio/app/features/home/background_header.dart';
import 'package:porkinio/app/features/home/custom_floating_action_button.dart';
import 'package:porkinio/app/features/transaction_list/transaction_form.dart';
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
                      child: Row(
                        children: [
                          const GoalsCard(
                            networkImage:
                                'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/ae99cef75be04e089032ab25010d4dfa_9366/Tenis_adidas_4D_Run_1.0_Branco_EG6264_01_standard.jpg',
                            subtitle: 'R\$ 350.00',
                            title: 'Tênis Adidas 4D Run',
                            progress: 1,
                          ),
                          const GoalsCard(
                            networkImage:
                                'https://www.thesource.ca/medias/20200417132249-108088050-A.jpg-mediaConversion-640-x-480-0?context=bWFzdGVyfGltYWdlc3wyNzk5OXxpbWFnZS9qcGVnfGltYWdlcy9oMjgvaGYxLzkyNDcwNTk3Mzg2NTQuanBnfDk0YWIyYTg2MzhkYzUzNjQxOWUxNzZiYzg0ZDk1ZDZhMDI4ZjJmZTczMzRjYTZhYjAxYWExMGExZjE5MTRiODg',
                            subtitle: 'R\$ 2400.00',
                            title: 'iPhone SE 64GB',
                            progress: 0.15,
                          ),
                          const GoalsCard(
                            networkImage:
                                'https://db7qxt7xxlq5m.cloudfront.net/n49shopv2_papelecia/images/products/60b658aa9fc56/xbox1jpg.jpg',
                            subtitle: 'R\$ 4600.00',
                            title: 'Xbox Series X',
                            progress: 0.08,
                          ),
                        ],
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
      ),
    );
  }
}

class GoalsCard extends StatelessWidget {
  final String title; // TODO: MUDAR PARA VALOR
  final String subtitle; // TODO MUDAR PARA DESCRIÇÃO
  final String networkImage;
  final double progress;

  const GoalsCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.networkImage,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            // ICONE DE OPÇÕES
            top: -8,
            right: 8,
            child: IconButton(
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            // ÁREA DO CARD
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.2,
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FittedBox(
                          // VALOR
                          child: Text(
                            subtitle,
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                        FittedBox(
                          // DESCRIÇÃO
                          child: Text(
                            title,
                            style:
                                Theme.of(context).textTheme.caption?.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  // BARRA DE PROGRESSO
                  elevation: 4,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.02,
                        color: Colors.white,
                      ),
                      Container(
                        width:
                            MediaQuery.of(context).size.width * 0.4 * progress,
                        height: MediaQuery.of(context).size.height * 0.018,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                // BORDA DA IMAGEM
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).cardTheme.color,
                ),
                height: MediaQuery.of(context).size.width * 0.19,
                width: MediaQuery.of(context).size.width * 0.19,
              ),
              ClipRRect(
                // IMAGEM
                borderRadius: BorderRadius.circular(100),
                child: Image(
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.width * 0.18,
                  width: MediaQuery.of(context).size.width * 0.18,
                  image: NetworkImage(networkImage),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
