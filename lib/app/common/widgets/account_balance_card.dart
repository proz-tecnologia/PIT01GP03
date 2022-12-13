import 'package:flutter/material.dart';
import 'package:porkinio/app/features/home/home_controller.dart';
import 'package:porkinio/app/common/widgets/transaction_form.dart';
import 'package:porkinio/app/common/constants/app_colors.dart';
import 'package:porkinio/app/common/constants/text_styles/app_text_styles_dark.dart';
import 'package:porkinio/app/common/constants/text_styles/app_text_styles_light.dart';

class AccountBalanceCard extends StatefulWidget {
  final TransactionController transactionController;

  const AccountBalanceCard({
    Key? key,
    required this.transactionController,
  }) : super(key: key);

  @override
  State<AccountBalanceCard> createState() => _AccountBalanceCardState();
}

class _AccountBalanceCardState extends State<AccountBalanceCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Porkin.io",
                            style: AppTextStylesDark.headline3Geen,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: widget.transactionController.visibilityOn
                                ? Text(
                                    'R\$ ${widget.transactionController.total().toStringAsFixed(2)}',
                                    style: AppTextStylesLight.headline4,
                                  )
                                : Text(
                                    '------',
                                    style: AppTextStylesLight.headline4,
                                  ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.transactionController.visibilityOn =
                                    !widget.transactionController.visibilityOn;
                              });
                            },
                            child: Icon(
                                widget.transactionController.visibilityOn
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.025),
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
                                                      .transactionController
                                                      .visibilityOn
                                                  ? Text(
                                                      'Entradas: R\$ ${widget.transactionController.sum().toStringAsFixed(2)}',
                                                      style: AppTextStylesLight
                                                          .body1,
                                                    )
                                                  : Text(
                                                      '---',
                                                      style: AppTextStylesLight
                                                          .headline4,
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
                                                      .transactionController
                                                      .visibilityOn
                                                  ? Text(
                                                      'Saídas: R\$ ${widget.transactionController.subtraction().toStringAsFixed(2)}',
                                                      style: AppTextStylesLight
                                                          .body1,
                                                    )
                                                  : Text(
                                                      '---',
                                                      style: AppTextStylesLight
                                                          .headline4,
                                                    ),
                                            ),
                                          ],
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
            );
  }
}
