import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
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
          primary: AppColors.primaryDark,
          onPrimary: Colors.white,
          secondary: AppColors.secondary,
          onSecondary: Colors.white,
          background: Colors.white,
          onBackground: AppColors.primaryDark,
          surface: Colors.white,
          onSurface: AppColors.primaryDark,
          error: AppColors.error,
          onError: Colors.white,
          brightness: Brightness.light,
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
            fontWeight: FontWeight.bold,
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
        drawerTheme: const DrawerThemeData(
          scrimColor: Color(0x66000000),
        ),
        cardTheme: const CardTheme(
          clipBehavior: Clip.antiAlias,
          color: Color(0xFFFF9100),
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          elevation: 8,
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
          backgroundColor: Color(0xFF00695C),
          foregroundColor: Color(0xFFFFFFFF),
        ),
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          dense: true,
        ),
      ),
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
