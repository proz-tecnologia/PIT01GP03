import 'package:flutter/material.dart';
import 'package:projeto_flutter/pages/home_page/home_page.dart';
import 'package:projeto_flutter/pages/login_page/login_page.dart';
import 'package:projeto_flutter/pages/recover_password_page/recover_password_page.dart';
import 'package:projeto_flutter/pages/singUp_page/signUp_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Porkin I.O.',
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        HomePage.home: (_) => const HomePage(),
        LoginPage.login: (_) => const LoginPage(),
        RecoverPasswordPage.recover: (_) => const RecoverPasswordPage(),
        SignUpPage.signUp: (_) => const SignUpPage(),
      },
    );
  }
}
