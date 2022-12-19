import 'package:flutter/material.dart';
import 'package:porkinio/app/common/constants/app_colors.dart';
import 'package:porkinio/app/common/constants/text_styles/app_text_styles_dark.dart';
import 'package:porkinio/app/common/widgets/custom_logo.dart';
import 'package:porkinio/app/features/home/home_page.dart';
import 'package:porkinio/app/features/login/login_page.dart';
import 'package:porkinio/app/features/splash/splash_controller.dart';
import 'package:porkinio/app/features/splash/splash_state.dart';
import 'package:porkinio/locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const routSplashPage = '/splash-page';

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _splashController = locator.get<SplashController>();
  @override
  // TODO: SPRINT 3: IMPLEMENTAR INICIO DA NAVEGAÇÃO DO APP NA SPLASH-SCREEN
  // TODO: COMPARAR ESSE METODO USANDO ABAIXO E O DO KAIO NA AULA 21
  void initState() {
    super.initState();
    _splashController.isUserLogged();
    if (_splashController.state is SplashSucessState) {
      Future.delayed(const Duration(seconds: 2)).then((value) async {
        return await Navigator.of(context)
            .pushReplacementNamed(HomePage.routeHomePage);
      });
    } else {
      Future.delayed(const Duration(seconds: 2)).then((value) async {
        return await Navigator.of(context)
            .pushReplacementNamed(LoginPage.routeLoginPage);
      });
    }
  }

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
              const CustomLogo(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                "Bem-vindo",
                style: AppTextStylesDark.subtitle1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
