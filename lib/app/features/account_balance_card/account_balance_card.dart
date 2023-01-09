import 'package:flutter/material.dart';
import 'package:porkinio/app/features/account_balance_card/account_balance_card_controller.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/common/themes/app_text_styles_light.dart';
import 'package:porkinio/app/features/account_balance_card/account_balance_card_state.dart';

class AccountBalanceCard extends StatefulWidget {
  const AccountBalanceCard(
      {super.key, required this.accountBalanceCardController});
  final AccountBalanceCardController accountBalanceCardController;

  @override
  State<AccountBalanceCard> createState() => _AccountBalanceCardState();
}

bool visibilityOn = true;

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
                          child: visibilityOn
                              ? FutureBuilder(
                                  future: widget.accountBalanceCardController
                                      .getTotalBalance(),
                                  builder: (context, snapshot) {
                                    return Text(
                                      'R\$ ${widget.accountBalanceCardController.totalBalance.toStringAsFixed(2)}',
                                      style: AppTextStylesLight.headline3,
                                    );
                                  })
                              : Text(
                                  'R\$ • • • •',
                                  style: AppTextStylesLight.headline3,
                                ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                visibilityOn = !visibilityOn;
                              },
                            );
                          },
                          child: Icon(
                            visibilityOn
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
                                        child: visibilityOn
                                            ? FutureBuilder(
                                                future: widget
                                                    .accountBalanceCardController
                                                    .getIncomeBalance(),
                                                builder: (context, snapshot) {
                                                  return Text(
                                                    'Entradas: R\$ ${widget.accountBalanceCardController.totalIncome.toStringAsFixed(2)}',
                                                    style: AppTextStylesLight
                                                        .body1,
                                                  );
                                                })
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
                                        child: visibilityOn
                                            ? FutureBuilder(
                                                future: widget
                                                    .accountBalanceCardController
                                                    .getExpensesBalance(),
                                                builder: (context, snapshot) {
                                                  return Text(
                                                    'Saídas: R\$ ${widget.accountBalanceCardController.totalExpenses.toStringAsFixed(2)}',
                                                    style: AppTextStylesLight
                                                        .body1,
                                                  );
                                                })
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
