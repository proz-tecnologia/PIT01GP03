import 'package:flutter/material.dart';
import 'package:porkinio/app/features/account_balance_card/account_balance_card_controller.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_controller.dart';
import 'package:porkinio/locator.dart';

class AccountBalanceCard extends StatefulWidget {
  const AccountBalanceCard({super.key});

  @override
  State<AccountBalanceCard> createState() => _AccountBalanceCardState();
}

bool visibilityOn = true;

class _AccountBalanceCardState extends State<AccountBalanceCard> {
  final transactionListController = locator.get<TransactionListController>();
  final accountBalanceCardController =
      locator.get<AccountBalanceCardController>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: transactionListController,
      builder: (context, snapshot) {
        return Card(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.21,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Carteira Virtual:',
                                style: Theme.of(context)
                                    .textTheme
                                    .overline
                                    ?.copyWith(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 208,
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
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  visibilityOn
                      ? FutureBuilder(
                          future:
                              accountBalanceCardController.getTotalBalance(),
                          builder: (context, snapshot) {
                            return Text(
                              'R\$ ${accountBalanceCardController.totalBalance.toStringAsFixed(2)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                            );
                          },
                        )
                      : Text(
                          'R\$ • • • •',
                          style:
                              Theme.of(context).textTheme.headline3?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recebimentos:',
                            style: Theme.of(context)
                                .textTheme
                                .overline
                                ?.copyWith(color: Colors.white),
                          ),
                          Container(
                            child: visibilityOn
                                ? FutureBuilder(
                                    future: accountBalanceCardController
                                        .getIncomeBalance(),
                                    builder: (context, snapshot) {
                                      return Text(
                                        'R\$ ${accountBalanceCardController.totalIncome.toStringAsFixed(2)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              color: Colors.white,
                                            ),
                                      );
                                    },
                                  )
                                : Text(
                                    'R\$ • • • •',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Pagamentos:',
                            style: Theme.of(context)
                                .textTheme
                                .overline
                                ?.copyWith(color: Colors.white),
                          ),
                          Container(
                            child: visibilityOn
                                ? FutureBuilder(
                                    future: accountBalanceCardController
                                        .getExpensesBalance(),
                                    builder: (context, snapshot) {
                                      return Text(
                                        'R\$ ${accountBalanceCardController.totalExpenses.toStringAsFixed(2)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              color: Colors.white,
                                            ),
                                      );
                                    },
                                  )
                                : Text(
                                    'R\$ • • • •',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                          ),
                        ],
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
