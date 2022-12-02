import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:porkinio/controllers/transaction_controller.dart';
import 'package:porkinio/view/components/transaction_form.dart';
import 'package:porkinio/view/pages/account_recovery_page.dart';
import 'package:porkinio/view/pages/home_page.dart';
import 'package:porkinio/view/pages/login_page.dart';
import 'package:porkinio/view/pages/sign_up_page.dart';
import 'package:porkinio/view/pages/splash_page.dart';
import 'package:provider/provider.dart';

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
          AccountRecoveryPage.routeAccountRecoveryPage: (_) =>
              const AccountRecoveryPage(),
          SignUpPage.routeSignUpPage: (_) => const SignUpPage(),
          TransactionForm.routeTransactionForm: (_) => const TransactionForm(),
        },
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale('pt', 'BR')],
      ),
    );
  }
}
