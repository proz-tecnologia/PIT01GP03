import 'package:flutter/material.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_card_options_button.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_controller.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_model.dart';

class PiggyBankCard extends StatelessWidget {
  const PiggyBankCard({
    Key? key,
    required this.model,
    required this.controller,
  }) : super(key: key);

  final PiggyBankModel model;
  final PiggyBankController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
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
                          'R\$ ${model.amount.toStringAsFixed(2)}',
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      FittedBox(
                        // DESCRIÇÃO
                        child: Text(
                          model.title,
                          style: Theme.of(context).textTheme.caption?.copyWith(
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
                      width: MediaQuery.of(context).size.width * 0.325,
                      height: MediaQuery.of(context).size.height * 0.02,
                      color: Colors.white,
                    ),
                    FutureBuilder(
                      future: null,
                      builder: (context, snapshot) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.018,
                          color: AppColors.primary,
                        );
                      }
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
                image: NetworkImage(model.networkImage),
              ),
            ),
          ],
        ),
        Positioned(
          // ICONE DE OPÇÕES
          top: -8,
          right: 8,
          child: PiggyBankCardOptionsButton(
            model: model,
            controller: controller,
          ),
        ),
      ],
    );
  }
}

// PiggyBankCardEditButton(model: piggyBankModel),
// PiggyBankCardDeleteButton(model: piggyBankModel)