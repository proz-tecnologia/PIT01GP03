import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';

class Card_account_balance extends StatelessWidget {
  const Card_account_balance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 160,
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
                      'Conta Corrente',
                      style: AppTextStylesLight.headline6,
                    ),
                    const Icon(
                      Icons.more_horiz,
                      color: AppColors.textLight,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'R\$ 100,00',
                      style: AppTextStylesLight.headline4,
                    ),
                    const Icon(
                      Icons.visibility_outlined,
                      color: AppColors.textLight,
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
                                height: 36,
                                width: 36,
                                decoration: const BoxDecoration(
                                  color: AppColors.backgroundLight,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.transform_rounded,
                                  color: Colors.green,
                                  size: 22,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Entradas',
                                    style: AppTextStylesLight.body2,
                                  ),
                                  Text(
                                    'R\$ 150,00',
                                    style: AppTextStylesLight.body1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 36,
                                width: 36,
                                decoration: const BoxDecoration(
                                  color: AppColors.backgroundLight,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.transform_rounded,
                                  color: Colors.red,
                                  size: 22,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Saídas',
                                    style: AppTextStylesLight.body2,
                                  ),
                                  Text(
                                    'R\$ -50,00',
                                    style: AppTextStylesLight.body1,
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
      ],
    );
  }
}
