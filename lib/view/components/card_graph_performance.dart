import 'package:flutter/material.dart';
import '../themes/app_colors.dart';
import '../themes/app_images.dart';
import '../themes/app_text_styles.dart';

class CardGraphPerformance extends StatelessWidget {
  const CardGraphPerformance({
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
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 320,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Chip(
                      label: SizedBox(
                        width: 56,
                        child: Text(
                          'Diário',
                          textAlign: TextAlign.center,
                          style: AppTextStylesDark.overline,
                        ),
                      ),
                    ),
                    Chip(
                      label: SizedBox(
                        width: 56,
                        child: Text(
                          'Semanal',
                          textAlign: TextAlign.center,
                          style: AppTextStylesDark.overline,
                        ),
                      ),
                    ),
                    Chip(
                      label: SizedBox(
                        width: 56,
                        child: Text(
                          'Mensal',
                          textAlign: TextAlign.center,
                          style: AppTextStylesDark.overline,
                        ),
                      ),
                    ),
                    Chip(
                      label: SizedBox(
                        width: 56,
                        child: Text(
                          'Anual',
                          textAlign: TextAlign.center,
                          style: AppTextStylesDark.overline,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 240,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.asset(AppImages.waiting),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
