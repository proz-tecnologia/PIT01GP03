import 'package:flutter/material.dart';
import 'package:projeto_flutter/pages/login_page/login_page.dart';
import 'package:projeto_flutter/pages/my_home_page/my_home_page.dart';
import 'package:projeto_flutter/pages/recover_password_page/recover_password_page.dart';
import 'package:projeto_flutter/pages/signup_page/signup_page.dart';
import 'package:projeto_flutter/pages/splash_page/splash_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const home = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home para desenvolvimento'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(LoginPage.login);
                },
                child: const Text('login_page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SignUpPage.signUp);
                },
                child: const Text('signUp_page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RecoverPasswordPage.recover);
                },
                child: const Text('recover_password_page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(MyHomePage.myHome);
                },
                child: const Text('myHome')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SplashPage.splash);
                },
                child: const Text('splash'))
          ],
        ),
      ),
    );
  }
}
