import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_images.dart';
import '../themes/app_text_styles.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const splash = '/splash';

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 4)).then((value) {
  //     Navigator.of(context).pushReplacementNamed(LoginPage.login);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.green,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.porkin, height: 320),
                  Text(
                    "Porkin.io",
                    style: AppTextStylesDark.headline3,
                  ),
                  const SizedBox(),
                  Text(
                    "Bem-vindo",
                    style: AppTextStylesDark.subtitle1,
                  ),
                ]),
          ), 
        ));
  }
}
