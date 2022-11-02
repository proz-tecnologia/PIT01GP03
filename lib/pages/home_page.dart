import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import 'components/card_account_balance.dart';
import 'components/card_goals_small_primary.dart';
import 'components/card_goals_small_secondary.dart';
import 'components/card_graph_performance.dart';
import 'components/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const home = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá, Usuário!'),
        backgroundColor: AppColors.primaryDark,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.monetization_on_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.wallet_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          children: [
            const CardAccountBalance(),
            const SizedBox(
              height: 36,
            ),
            const CardGraphPerformance(),
            const SizedBox(
              height: 36,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.antiAlias,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CardGoalsSmallPrimary(),
                  SizedBox(width: 16),
                  CardGoalsSmallSecondary(),
                  SizedBox(width: 16),
                  CardGoalsSmallPrimary(),
                  SizedBox(width: 16),
                  CardGoalsSmallSecondary(),
                  SizedBox(width: 16),
                  CardGoalsSmallPrimary(),
                  SizedBox(width: 16),
                  CardGoalsSmallSecondary(),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const DrawerCustom(),
    );
  }
}
