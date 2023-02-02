import 'package:flutter/material.dart';
import 'package:porkinio/app/features/virtual_wallet/virtual_wallet_controller.dart';
import 'package:porkinio/app/features/transaction_list/transaction_controller.dart';
import 'package:porkinio/app/features/virtual_wallet/virtual_wallet_model.dart';
import 'package:porkinio/locator.dart';

class VirtualWalletCard extends StatefulWidget {
  const VirtualWalletCard({super.key});

  @override
  State<VirtualWalletCard> createState() => _VirtualWalletCardState();
}

bool visibilityOn = true;

class _VirtualWalletCardState extends State<VirtualWalletCard> {
  final transactionController = locator.get<TransactionController>();
  final virtualWalletController = locator.get<VirtualWalletController>();
  final model = locator.get<VirtualWalletModel>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: transactionController,
      builder: (context, snapshot) {
        return Card(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.21,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            visibilityOn = !visibilityOn;
                          },
                        );
                      },
                      child: Icon(
                        visibilityOn ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Carteira Virtual:',
                                style: Theme.of(context)
                                    .textTheme
                                    .overline
                                    ?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      visibilityOn
                          ? FutureBuilder(
                              future: virtualWalletController.getBalance(model),
                              builder: (context, snapshot) {
                                return Text(
                                  'R\$ ${model.balance?.toStringAsFixed(2)}',
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.trending_up_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
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
                                            future: virtualWalletController
                                                .getIncome(model),
                                            builder: (context, snapshot) {
                                              return Text(
                                                'R\$ ${model.income?.toStringAsFixed(2)}',
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
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.trending_down_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                            future: virtualWalletController
                                                .getExpenses(model),
                                            builder: (context, snapshot) {
                                              return Text(
                                                'R\$ ${model.expenses?.toStringAsFixed(2)}',
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
                      // FutureBuilder(
                      //     future: virtualWalletController.updateWallet(model),
                      //     builder: (context, snapshot) {
                      //       return SizedBox();
                      //     }),
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
