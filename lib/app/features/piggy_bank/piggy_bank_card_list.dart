import 'package:flutter/material.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_card.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_controller.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_model.dart';
import 'package:porkinio/app/features/virtual_wallet/virtual_wallet_controller.dart';

class PiggyBankCardList extends StatelessWidget {
  const PiggyBankCardList({
    Key? key,
    required this.controller,
    required this.walletController,
  }) : super(key: key);

  final PiggyBankController controller;
  final VirtualWalletController walletController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.5,
      child: StreamBuilder<List<PiggyBankModel>>(
        stream: controller.streamPiggyBankList(),
        builder: (context, snapshot) {
          if (snapshot.data != null && snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'Sem Porkinios cadastrados.',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.teal[800]),
                textAlign: TextAlign.center,
              ),
            );
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data!
                    .map(
                      (model) => PiggyBankCard(
                        model: model,
                        controller: controller,
                      ),
                    )
                    .toList(),
              ),
            );
          } else {
            return Text('Encontramos um erro: "${snapshot.error}"');
          }
        },
      ),
    );
  }
}
