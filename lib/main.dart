import 'package:flutter/material.dart';
import 'package:projeto_flutter/controllers/transaction_controller.dart';
import 'package:projeto_flutter/view/pages/form_transaction.dart';
import 'package:projeto_flutter/view/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'view/pages/login_page.dart';
import 'view/pages/recover_password_page.dart';
import 'view/pages/signup_page.dart';
import 'view/pages/splash_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(
        create: (context) => TransactionController(),
      )
    ],    
      child: MaterialApp(
        title: 'Porkin.io',
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.home,
        routes: {
          HomePage.home: (_) => const HomePage(),
          SplashPage.splash: (_) => const SplashPage(),
          LoginPage.login: (_) => const LoginPage(),
          RecoverPasswordPage.recover: (_) => const RecoverPasswordPage(),
          SignUpPage.signUp: (_) => const SignUpPage(),
          FormTransaction.formTransaction: (_) => const FormTransaction(),
        },
      ),
    );
  }
}
