import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porkinio/app/features/account_recovery/account_recovery_page.dart';
import 'package:porkinio/app/features/home/home_page.dart';
import 'package:porkinio/app/features/sign_in/sign_in_page.dart';
import 'package:porkinio/app/features/sing_up/sign_up_page.dart';
import 'package:porkinio/app/features/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Porkin.io',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.light,
        colorScheme: const ColorScheme(
          onPrimary: Color(0xFFFFFFFF),
          secondary: Color(0xFFFF9100),
          background: Color(0xFF00695C),
          brightness: Brightness.light,
          error: Color(0xFF00695C),
          onBackground: Color(0xFF00695C),
          onError: Color(0xFF00695C),
          onSecondary: Color(0xFF00695C),
          onSurface: Color(0xFF00695C),
          primary: Color(0xFF00695C),
          surface: Color(0xFF00695C),
        ),
        textTheme: TextTheme(
          button: GoogleFonts.getFont(
            'Fredoka One',
          ),
          caption: GoogleFonts.getFont(
            'Sora',
          ),
          overline: GoogleFonts.getFont(
            'Sora',
          ),
          bodyText1: GoogleFonts.getFont(
            'Roboto',
          ),
          bodyText2: GoogleFonts.getFont(
            'Roboto',
          ),
          headline1: GoogleFonts.getFont(
            'Fredoka One',
          ),
          headline2: GoogleFonts.getFont(
            'Fredoka One',
          ),
          headline3: GoogleFonts.getFont(
            'Fredoka One',
          ),
          headline4: GoogleFonts.getFont(
            'Fredoka One',
          ),
          headline5: GoogleFonts.getFont(
            'Fredoka One',
          ),
          headline6: GoogleFonts.getFont(
            'Fredoka One',
          ),
          subtitle1: GoogleFonts.getFont(
            'Fredoka One',
          ),
          subtitle2: GoogleFonts.getFont(
            'Fredoka One',
          ),
        ),
        cardTheme: const CardTheme(
          color: Color(0xFF00695C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            side: BorderSide(
              width: 2.0,
              color: Color(0xFFFFFFFF),
              style: BorderStyle.solid,
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          color: Color(0xFF004d40),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Color(0xFFFFFFFF),
        ),
        
      ),
      // theme: ThemeData(
      //   visualDensity: VisualDensity.comfortable,
      //   primaryColor: Color(0xFF00695C),
      //   primaryColorLight: Color(0xFF48A999),
      //   primaryColorDark: Color(0xFF004C40),
      //   shadowColor: Color(0xFF004C40),
      //   bottomAppBarColor: Color(0xFF004C40),
      //   cardColor: Color(0xFFFF9100),
      //   splashColor: Color(0xFFFF9100),
      //   textTheme: GoogleFonts.getTextTheme(
      //     "Roboto",
      //     const TextTheme(
      //       headline1: TextStyle(
      //         fontSize: 88,
      //       ),
      //     ),
      //   ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(secondary: Colors.orangeAccent),
      // ),
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
