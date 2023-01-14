import 'package:flutter/material.dart';
import 'package:porkinio/app/common/themes/app_images.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.porkin,
            height: MediaQuery.of(context).size.height * 0.25),
        Text(
          "Porkin.io",
          style: Theme.of(context).textTheme.headline3?.copyWith(
                color: Theme.of(context).primaryColorDark,
              ),
        ),
      ],
    );
  }
}
