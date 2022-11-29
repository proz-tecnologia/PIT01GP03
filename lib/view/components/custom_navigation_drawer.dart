import 'package:flutter/material.dart';
import 'package:projeto_flutter/view/pages/login_page.dart';
import 'package:projeto_flutter/view/pages/account_recovery_page.dart';
import 'package:projeto_flutter/view/pages/signup_page.dart';
import 'package:projeto_flutter/view/pages/splash_page.dart';
import 'package:projeto_flutter/view/themes/app_colors.dart';
import 'package:projeto_flutter/view/themes/app_text_styles.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  // TODO: Ajustar padding

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
              Navigator.of(context).pushNamed(AccountRecoveryPage.routeAccountRecoveryPage);
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