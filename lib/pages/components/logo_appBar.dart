// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:projeto_flutter/themes/app_colors.dart';
import 'package:projeto_flutter/themes/app_images.dart';
import 'package:projeto_flutter/themes/app_text_styles.dart';

class LogoAppBar extends StatelessWidget {
  const LogoAppBar({super.key});

  static const login = '/login';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.36,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 42),
      decoration: const BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Column(children: [
        Image.asset(
          AppImages.porkin,
          height: 200,
          width: 200,
        ),
        Text(
          "Porkin.io",
          style: MyTextStyles.titleHome,
        ),
      ]),
    );
  }
}
