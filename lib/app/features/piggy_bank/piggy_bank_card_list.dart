import 'package:flutter/material.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_card.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_controller.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_model.dart';

class PiggyBankCardList extends StatelessWidget {
  const PiggyBankCardList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PiggyBankController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.5,
      child: StreamBuilder<List<PiggyBankModel>>(
        stream: controller.streamPiggyBankList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Encontramos um erro: "${snapshot.error}"');
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
                        piggyBankModel: model, piggyBankController: controller,
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
