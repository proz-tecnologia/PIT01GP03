import 'package:flutter/material.dart';
import 'package:projeto_flutter/view/pages/home_page.dart';
import 'view/pages/login_page.dart';
import 'view/pages/signup_page.dart';
import 'view/pages/splash_page.dart';
import 'view/pages/recover_password_page.dart';
import 'package:responsive_framework/responsive_framework.dart';


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
      title: 'Porkin.io',
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
        maxWidth: 2200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.home,
      routes: {
        HomePage.home: (_) => const HomePage(),
        SplashPage.splash: (_) => const SplashPage(),
        LoginPage.login: (_) => const LoginPage(),
        RecoverPasswordPage.recover: (_) => const RecoverPasswordPage(),
        SignUpPage.signUp: (_) => const SignUpPage(),
      },
    );
  }
}
