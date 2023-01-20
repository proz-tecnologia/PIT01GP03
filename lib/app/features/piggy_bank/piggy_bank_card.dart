import 'package:flutter/material.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_card_delete_button.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_card_edit_button.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_card_options_button.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_controller.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_model.dart';

class PiggyBankCard extends StatelessWidget {
  const PiggyBankCard({
    Key? key,
    required this.piggyBankModel, required this.piggyBankController,
  }) : super(key: key);

  final PiggyBankModel piggyBankModel;
  final PiggyBankController piggyBankController;

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
                          'R\$ ${piggyBankModel.amount.toStringAsFixed(2)}',
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      FittedBox(
                        // DESCRIÇÃO
                        child: Text(
                          piggyBankModel.title,
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
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.02,
                      color: Colors.white,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width *
                          0.4 *
                          ((piggyBankModel.amount) /
                              400), // TODO: PEGAR VALOR DA CARTEIRA VIRTUAL
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
                image: NetworkImage(piggyBankModel.networkImage),
              ),
            ),
          ],
        ),
        Positioned(
          // ICONE DE OPÇÕES
          top: -8,
          right: 8,
          child: PiggyBankPopupMenu(model: piggyBankModel, controller: piggyBankController,),
        ),
      ],
    );
  }
}

// PiggyBankCardEditButton(model: piggyBankModel),
// PiggyBankCardDeleteButton(model: piggyBankModel)