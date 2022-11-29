import 'package:flutter/material.dart';
import 'package:projeto_flutter/controllers/transaction_controller.dart';
import 'package:projeto_flutter/models/transaction_model.dart';
import 'package:projeto_flutter/view/components/transaction_form.dart';
import 'package:projeto_flutter/view/themes/app_text_styles.dart';
import 'package:provider/provider.dart';
import '../themes/app_colors.dart';


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
    final TransactionController transactions = Provider.of(context);

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
                        transactions.visibilityOn = !transactions.visibilityOn;
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height:
                                  (MediaQuery.of(context).size.height) * 0.10,
                              width: (MediaQuery.of(context).size.width) * 0.10,
                              decoration: const BoxDecoration(
                                color: AppColors.backgroundLight,
                                shape: BoxShape.circle,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    TransactionForm.routeTransactionForm,
                                    arguments: TransactionModel(
                                      id: '',
                                      title: '',
                                      description: '',
                                      ammount: 0,
                                      date: DateTime.now(),
                                      tipo: true,
                                      // TODO: trocar pela tag correspondente
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.keyboard_arrow_up,
                                  color: AppColors.primary,
                                  size: 22,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Entradas',
                                  style: AppTextStylesLight.body1,
                                ),
                                Container(
                                  child: transactions.visibilityOn
                                      ? Text(
                                          'R\$ ${transactions.sum().toStringAsFixed(2)}',
                                          style: AppTextStylesLight.body1,
                                        )
                                      : Text(
                                          '---',
                                          style: AppTextStylesLight.headline4,
                                        ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height:
                                  (MediaQuery.of(context).size.height) * 0.10,
                              width: (MediaQuery.of(context).size.width) * 0.10,
                              decoration: const BoxDecoration(
                                color: AppColors.backgroundLight,
                                shape: BoxShape.circle,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    TransactionForm.routeTransactionForm,
                                    arguments: TransactionModel(
                                      id: '',
                                      title: '',
                                      description: '',
                                      ammount: 0,
                                      date: DateTime.parse("2012-02-27"),
                                      tipo: false,
                                      // TODO: trocar pela tag correspondente
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.errorColor,
                                  size: 22,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Saídas',
                                  style: AppTextStylesLight.body1,
                                ),
                                Container(
                                  child: transactions.visibilityOn
                                      ? Text(
                                          'R\$ ${transactions.subtraction().toStringAsFixed(2)}',
                                          style: AppTextStylesLight.body1,
                                        )
                                      : Text(
                                          '---',
                                          style: AppTextStylesLight.headline4,
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
    );
  }
}
