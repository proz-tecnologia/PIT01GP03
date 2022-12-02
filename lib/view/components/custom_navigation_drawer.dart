import 'package:flutter/material.dart';
import 'package:porkinio/view/pages/login_page.dart';
import 'package:porkinio/view/pages/account_recovery_page.dart';
import 'package:porkinio/view/pages/sign_up_page.dart';
import 'package:porkinio/view/pages/splash_page.dart';
import 'package:porkinio/view/themes/app_colors.dart';
import 'package:porkinio/view/themes/text_styles/app_text_styles_dark.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  // TODO: PAULO: AJUSTAR LAYOUT

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.green,
            ),
            child: Text(
              'Navegação para telas desenvolvidas',
              style: AppTextStylesDark.headline4,
            ),
          ),
          ListTile(
            title: Text(
              'Página de Login',
              style: AppTextStylesDark.headline6,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(LoginPage.routeLoginPage);
            },
          ),
          ListTile(
            title: Text(
              'Página de Recuperação de Senha',
              style: AppTextStylesDark.headline6,
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(AccountRecoveryPage.routeAccountRecoveryPage);
            },
          ),
          ListTile(
            title: Text(
              'Página de Cadastro',
              style: AppTextStylesDark.headline6,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(SignUpPage.routeSignUpPage);
            },
          ),
          ListTile(
            title: Text(
              'Splash Screen',
              style: AppTextStylesDark.headline6,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(SplashPage.routSplashPage);
            },
          ),
        ],
      ),
    );
  }
}
