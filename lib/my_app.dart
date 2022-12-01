import 'package:flutter/material.dart';
import 'package:projeto_flutter/controllers/transaction_controller.dart';
import 'package:projeto_flutter/view/components/transaction_form.dart';
import 'package:projeto_flutter/view/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'view/pages/login_page.dart';
import 'view/pages/account_recovery_page.dart';
import 'view/pages/sign_up_page.dart';
import 'view/pages/splash_page.dart';

// TODO: PAULO: VERIFICAR MELHOR PRÁTICA DE GESTÃO DE ROTAS

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
        initialRoute: HomePage.routeHomePage,
        routes: {
          HomePage.routeHomePage: (_) => const HomePage(),
          SplashPage.routSplashPage: (_) => const SplashPage(),
          LoginPage.routeLoginPage: (_) => const LoginPage(),
          AccountRecoveryPage.routeAccountRecoveryPage: (_) => const AccountRecoveryPage(),
          SignUpPage.routeSignUpPage: (_) => const SignUpPage(),
          TransactionForm.routeTransactionForm: (_) => const TransactionForm(),
        },
      ),
    );
  }
}
