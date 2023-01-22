import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:porkinio/app/common/themes/custom_theme_data.dart';
import 'package:porkinio/app/features/account_recovery/account_recovery_page.dart';
import 'package:porkinio/app/features/home/home_page.dart';
import 'package:porkinio/app/features/sign_in/sign_in_page.dart';
import 'package:porkinio/app/features/sign_up/sign_up_page.dart';
import 'package:porkinio/app/features/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Porkin.io',
      theme: customThemeData(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
        Locale('pt', 'BR'),
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.route,
      routes: {
        HomePage.route: (_) => const HomePage(),
        SplashPage.route: (_) => const SplashPage(),
        SignInPage.route: (_) => const SignInPage(),
        AccountRecoveryPage.route: (_) => const AccountRecoveryPage(),
        SignUpPage.route: (_) => const SignUpPage(),
      },
    );
  }
}
