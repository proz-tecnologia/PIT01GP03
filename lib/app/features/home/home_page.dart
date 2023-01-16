import 'package:flutter/material.dart';
import 'package:porkinio/app/common/themes/app_images.dart';
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
  final accountBalanceCardController =
      locator.get<AccountBalanceCardController>();
  final _secureStorage = const SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Olá, ${locator.get<AuthService>().currentUser?.displayName}!'),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GoalsCard(
                  networkImage:
                      'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/ae99cef75be04e089032ab25010d4dfa_9366/Tenis_adidas_4D_Run_1.0_Branco_EG6264_01_standard.jpg',
                  icon: Icons.more_vert,
                  subtitle: 'R\$ 350.00',
                  title: 'Tênis Adidas 4D Run 1.0',
                ),
                GoalsCard(
                  networkImage:
                      'https://www.showmetech.com.br/wp-content/uploads//2020/11/series-x-review.jpg',
                  icon: Icons.more_vert,
                  subtitle: 'R\$ 4600.00',
                  title: 'Xbox Series X',
                ),
              ],
            ),
          ),
          const SizedBox(height: 72),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActionButton(
          transactionListController: transactionListController),
    );
  }
}

class GoalsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String networkImage;
  final IconData icon;

  const GoalsCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.networkImage,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.width * 0.5,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image(
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                image: NetworkImage(networkImage),
              ),
              ListTile(
                tileColor: Colors.teal,
                visualDensity: VisualDensity.compact,
                dense: true,
                trailing: Icon(icon),
                title: FittedBox(
                  child: Text(
                    title,
                  ),
                ),
                subtitle: FittedBox(
                  child: Text(subtitle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
