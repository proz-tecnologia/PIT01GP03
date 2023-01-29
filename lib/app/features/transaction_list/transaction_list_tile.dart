import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/features/transaction_list/transaction_controller.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_tile_options_button.dart';
import 'package:porkinio/app/models/transaction_model.dart';

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({
    Key? key,
    required this.model,
    required this.controller,
  }) : super(key: key);

  final TransactionModel model;
  final TransactionController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.05,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      model.title,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.grey[800],
                          ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              visualDensity: VisualDensity.comfortable,
              style: ListTileStyle.list,
              leading: model.category
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: AppColors.primary,
                              child: Icon(Icons.trending_up_rounded),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'R\$ ${model.amount.toStringAsFixed(2)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(
                                    color: AppColors.primary,
                                  ),
                              overflow: TextOverflow.fade,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.secondary,
                              foregroundColor: Colors.grey[100],
                              child: const Icon(Icons.trending_down_rounded),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'R\$ ${model.amount.toStringAsFixed(2)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(
                                    color: AppColors.secondary,
                                  ),
                              overflow: TextOverflow.fade,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 1,
                    height: MediaQuery.of(context).size.width * 0.07,
                    color: Colors.grey,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      model.category
                          ? Text(
                              'Recebimento',
                              style: Theme.of(context)
                                  .textTheme
                                  .overline
                                  ?.copyWith(
                                    fontSize: 8,
                                    color: Colors.grey,
                                  ),
                            )
                          : Text(
                              'Pagamento',
                              style: Theme.of(context)
                                  .textTheme
                                  .overline
                                  ?.copyWith(
                                    fontSize: 8,
                                    color: Colors.grey,
                                  ),
                            ),
                      Text(
                        DateFormat("d 'de' MMMM 'de' y", "pt_BR")
                            .format(model.date),
                        style: Theme.of(context).textTheme.overline?.copyWith(
                              fontSize: 8,
                              color: Colors.grey,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: TransactionListTileOptionsButton(
                model: model,
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
