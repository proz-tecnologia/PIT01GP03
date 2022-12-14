

import 'package:flutter/material.dart';
import 'package:porkinio/app/common/constants/app_colors.dart';
import 'package:porkinio/app/common/constants/text_styles/app_text_styles_dark.dart';
import 'package:porkinio/app/features/account_recovery/account_recovery_page.dart';
import 'package:porkinio/app/features/login/login_page.dart';
import 'package:porkinio/app/features/sing_up/sign_up_page.dart';
import 'package:porkinio/app/features/splash/splash_page.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

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
