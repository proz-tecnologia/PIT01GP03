import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import 'components/card_account_balance.dart';
import 'components/card_goals_small_primary.dart';
import 'components/card_goals_small_secondary.dart';
import 'components/card_graph_performance.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const home = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá, Usuário!'),
        backgroundColor: AppColors.primaryDark,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
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
            const Card_account_balance(),
            const SizedBox(
              height: 36,
            ),
            const Card_graph_performance(),
            const SizedBox(
              height: 36,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.antiAlias,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  card_goals_small_primary(),
                  SizedBox(width: 16),
                  card_goals_small_secondary(),
                  SizedBox(width: 16),
                  card_goals_small_primary(),
                  SizedBox(width: 16),
                  card_goals_small_secondary(),
                  SizedBox(width: 16),
                  card_goals_small_primary(),
                  SizedBox(width: 16),
                  card_goals_small_secondary(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
