import 'package:flutter/material.dart';
import 'package:porkinio/app/features/account_recovery/account_recovery_page.dart';
import 'package:porkinio/app/features/sign_in/sign_in_page.dart';
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
            child: Text(
              'Navegação',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          ListTile(
            title: Text(
              'Splash Screen',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(SplashPage.route);
            },
          ),
          ListTile(
            title: Text(
              'Página de Login',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(SignInPage.route);
            },
          ),
          ListTile(
            title: Text(
              'Página de Cadastro',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(SignUpPage.route);
            },
          ),
          ListTile(
            title: Text(
              'Página de Recuperação de Senha',
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(AccountRecoveryPage.route);
            },
          ),
        ],
      ),
    );
  }
}
