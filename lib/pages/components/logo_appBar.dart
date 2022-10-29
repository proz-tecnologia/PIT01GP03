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
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      decoration: const BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize
                .min, //faz com que tamanho da column fique tamanho dos filhos
            children: [
              Image.asset(
                AppImages.porkin,
                height: 175,
                width: 175,
              ),
              Text(
                "Porkin.io",
                style: MyTextStyles.titleHome,
              ),
            ]),
      ),
    );
  }
}
