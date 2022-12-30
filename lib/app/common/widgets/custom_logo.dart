import 'package:flutter/material.dart';
import 'package:porkinio/app/common/themes/app_images.dart';
import 'package:porkinio/app/common/themes/app_text_styles_dark.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.porkin,
            height: MediaQuery.of(context).size.height * 0.40),
        Text(
          "Porkin.io",
          style: AppTextStylesDark.headline3,
        ),
      ],
    );
  }
}
