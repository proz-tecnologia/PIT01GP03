import 'package:flutter/material.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/features/account_recovery/account_recovery_page.dart';
import 'package:porkinio/app/features/sign_in/sign_in_page.dart';
import 'package:porkinio/app/features/sign_up/sign_up_page.dart';
import 'package:porkinio/app/features/splash/splash_page.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:porkinio/locator.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.primaryDark),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  visualDensity: VisualDensity.standard,
                  dense: true,
                  leading: const CircleAvatar(
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                  title: FittedBox(
                    child: Text(
                      '${locator.get<AuthService>().currentUser?.displayName}',
                      style: Theme.of(context).textTheme.button?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  subtitle: FittedBox(
                    child: Text(
                      '${locator.get<AuthService>().currentUser?.email}',
                      style: Theme.of(context).textTheme.overline?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListTile(
              leading: const Icon(Icons.logo_dev),
              title: Text(
                'Splash Screen',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(SplashPage.route);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListTile(
              leading: const Icon(Icons.login),
              title: Text(
                'Página de Login',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(SignInPage.route);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListTile(
              leading: const Icon(Icons.description_outlined),
              title: Text(
                'Página de Cadastro',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(SignUpPage.route);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListTile(
              leading: const Icon(Icons.settings_backup_restore_rounded),
              title: Text(
                'Página de Recuperação de Senha',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(AccountRecoveryPage.route);
              },
            ),
          ),
        ],
      ),
    );
  }
}
