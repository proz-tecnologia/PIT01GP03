import 'package:flutter/material.dart';
import 'package:porkinio/controllers/transaction_controller.dart';
import 'package:porkinio/models/transaction_model.dart';
import 'package:porkinio/view/components/transaction_form.dart';
import 'package:porkinio/view/themes/app_colors.dart';
import 'package:porkinio/view/themes/text_styles/app_text_styles_dark.dart';
import 'package:porkinio/view/themes/text_styles/app_text_styles_light.dart';
import 'package:provider/provider.dart';

class AccountBalanceCard extends StatefulWidget {
  const AccountBalanceCard({
    Key? key,
  }) : super(key: key);

  @override
  State<AccountBalanceCard> createState() => _AccountBalanceCardState();
}

class _AccountBalanceCardState extends State<AccountBalanceCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionController>(
      builder: (context, transactions, child) {
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
                        child: transactions.visibilityOn
                            ? Text(
                                'R\$ ${transactions.total().toStringAsFixed(2)}',
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
                            transactions.visibilityOn =
                                !transactions.visibilityOn;
                          });
                        },
                        child: Icon(transactions.visibilityOn
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ElevatedButton.icon(
                                            onPressed: () {
                                              Navigator.of(context).pushNamed(
                                                TransactionForm
                                                    .routeTransactionForm,
                                                arguments: TransactionModel(
                                                  id: '',
                                                  title: '',
                                                  ammount: 0,
                                                  date: DateTime.now(),
                                                  category: true,
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.keyboard_arrow_up,
                                              color: AppColors.primary,
                                              size: 22,
                                            ),
                                            label: const Text('Adicionar'),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColors.green,
                                            )),
                                        Container(
                                          child: transactions.visibilityOn
                                              ? Text(
                                                  'Entradas: R\$ ${transactions.sum().toStringAsFixed(2)}',
                                                  style:
                                                      AppTextStylesLight.body1,
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
                                        ElevatedButton.icon(
                                            onPressed: () {
                                              Navigator.of(context).pushNamed(
                                                TransactionForm
                                                    .routeTransactionForm,
                                                arguments: TransactionModel(
                                                  id: '',
                                                  title: '',
                                                  ammount: 0,
                                                  date: DateTime.now(),
                                                  category: false,
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down,
                                              color: AppColors.primary,
                                              size: 22,
                                            ),
                                            label: const Text('Retirar'),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColors.green,
                                            )),
                                        Container(
                                          child: transactions.visibilityOn
                                              ? Text(
                                                  'Saídas: R\$ ${transactions.subtraction().toStringAsFixed(2)}',
                                                  style:
                                                      AppTextStylesLight.body1,
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
      },
    );
  }
}
