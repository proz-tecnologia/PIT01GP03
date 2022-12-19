import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:porkinio/app/common/widgets/transaction_form.dart';
import 'package:porkinio/app/features/account_recovery/account_recovery_page.dart';
import 'package:porkinio/app/features/home/home_page.dart';
import 'package:porkinio/app/features/login/login_page.dart';
import 'package:porkinio/app/features/sing_up/sign_up_page.dart';
import 'package:porkinio/app/features/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Porkin.io',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
        Locale('pt', 'BR'),
      ],
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
    );
  }
}
