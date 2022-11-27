import 'package:flutter/material.dart';
import 'package:projeto_flutter/view/pages/login_page.dart';
import 'package:projeto_flutter/view/pages/recover_password_page.dart';
import 'package:projeto_flutter/view/pages/signup_page.dart';
import 'package:projeto_flutter/view/pages/splash_page.dart';
import 'package:projeto_flutter/view/themes/app_colors.dart';
import 'package:projeto_flutter/view/themes/app_text_styles.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

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
              Navigator.of(context).pushNamed(LoginPage.login);
            },
          ),
          ListTile(
            title: Text(
              'Página de Recuperação de Senha',
              style: AppTextStylesDark.headline6,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(RecoverPasswordPage.recover);
            },
          ),
          ListTile(
            title: Text(
              'Página de Cadastro',
              style: AppTextStylesDark.headline6,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(SignUpPage.signUp);
            },
          ),
          ListTile(
            title: Text(
              'Splash Screen',
              style: AppTextStylesDark.headline6,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(SplashPage.splash);
            },
          ),
    
        ],
      ),
    );
  }
}
