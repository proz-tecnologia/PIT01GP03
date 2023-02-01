import 'package:flutter/material.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_card_options_button.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_controller.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_model.dart';
import 'package:porkinio/app/features/virtual_wallet/virtual_wallet_model.dart';
import 'package:porkinio/locator.dart';

class PiggyBankCard extends StatefulWidget {
  const PiggyBankCard({
    Key? key,
    required this.model,
    required this.controller,
  }) : super(key: key);

  final PiggyBankModel model;
  final PiggyBankController controller;

  @override
  State<PiggyBankCard> createState() => _PiggyBankCardState();
}

class _PiggyBankCardState extends State<PiggyBankCard> {
  final walletModel = locator.get<VirtualWalletModel>();

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
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.25,
                child: Card(
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
                            'R\$ ${widget.model.amount.toStringAsFixed(2)}',
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                        FittedBox(
                          // DESCRIÇÃO
                          child: Text(
                            widget.model.title,
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
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: Card(
                  // BARRA DE PROGRESSO
                  color: Colors.white,
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
                        future: widget.controller.readBalance(walletModel),
                        builder: (context, snapshot) {
                          return Container(
                            width: MediaQuery.of(context).size.width *
                                0.32 *
                                (walletModel.balance ?? 0.1) /
                                widget.model.amount,
                            height: MediaQuery.of(context).size.height * 0.022,
                            color: AppColors.primary,
                          );
                        },
                      ),
                    ],
                  ),
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
                image: NetworkImage(widget.model.networkImage),
              ),
            ),
          ],
        ),
        Positioned(
          // ICONE DE OPÇÕES
          top: -8,
          right: 8,
          child: PiggyBankCardOptionsButton(
            model: widget.model,
            controller: widget.controller,
          ),
        ),
      ],
    );
  }
}

// PiggyBankCardEditButton(model: piggyBankModel),
// PiggyBankCardDeleteButton(model: piggyBankModel)