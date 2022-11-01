import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';
import 'card_account_balance.dart';
import 'card_goals_small_primary.dart';
import 'card_goals_small_secondary.dart';
import 'card_graph_performance.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static const home = '/';

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
        padding: EdgeInsets.all(36.0),
        child: Container(
          child: Column(
            children: [
              card_account_balance(),
              SizedBox(
                height: 36,
              ),
              card_graph_performance(),
              SizedBox(
                height: 36,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.antiAlias,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
      ),
    );
  }
}







// ignore: camel_case_types

