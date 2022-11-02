import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'recover_password_page.dart';
import 'signup_page.dart';
import 'splash_page.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  static const navigation = '/navigation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de Desenvolvimento'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(LoginPage.login);
                },
                child: const Text('Página de Login'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SignUpPage.signUp);
                },
                child: const Text('Página de Cadastro'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RecoverPasswordPage.recover);
                },
                child: const Text('Página de Recuperação de Senha'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(HomePage.home);
                },
                child: const Text('Página Home'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SplashPage.splash);
                },
                child: const Text('Splash Screen'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
