import 'package:flutter/material.dart';
import 'package:porkinio/app/features/home/account_balance_card_controller.dart';
import 'package:porkinio/app/common/constants/app_colors.dart';
import 'package:porkinio/app/common/constants/text_styles/app_text_styles_dark.dart';
import 'package:porkinio/app/common/constants/text_styles/app_text_styles_light.dart';

class AccountBalanceCard extends StatefulWidget {
  final AccountBalanceCardController accountBalanceCardController;

  const AccountBalanceCard({
    Key? key,
    required this.accountBalanceCardController,
  }) : super(key: key);

  @override
  State<AccountBalanceCard> createState() => _AccountBalanceCardState();
}

class _AccountBalanceCardState extends State<AccountBalanceCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.10,
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: AppColors.primaryDark,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            color: AppColors.secondary,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child:
                              widget.accountBalanceCardController.visibilityOn
                                  ? Text(
                                      'R\$ ${widget.accountBalanceCardController.totalBalance().toStringAsFixed(2)}',
                                      style: AppTextStylesLight.headline3,
                                    )
                                  : Text(
                                      'R\$ • • • •',
                                      style: AppTextStylesLight.headline3,
                                    ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                widget.accountBalanceCardController
                                        .visibilityOn =
                                    !widget.accountBalanceCardController
                                        .visibilityOn;
                              },
                            );
                          },
                          child: Icon(
                            widget.accountBalanceCardController.visibilityOn
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.textLight,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: widget
                                                .accountBalanceCardController
                                                .visibilityOn
                                            ? Text(
                                                'Entradas: R\$ ${widget.accountBalanceCardController.sumBalance().toStringAsFixed(2)}',
                                                style: AppTextStylesLight.body1,
                                              )
                                            : Text(
                                                'Entradas: R\$ • • • •',
                                                style: AppTextStylesLight.body1,
                                              ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.015),
                                      Container(
                                        child: widget
                                                .accountBalanceCardController
                                                .visibilityOn
                                            ? Text(
                                                'Saídas: R\$ ${widget.accountBalanceCardController.subtractBalance().toStringAsFixed(2)}',
                                                style: AppTextStylesLight.body1,
                                              )
                                            : Text(
                                                'Saídas: R\$ • • • •',
                                                style: AppTextStylesLight.body1,
                                              ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
