import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData customThemeData() {
    return ThemeData(
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
      drawerTheme: const DrawerThemeData(
        scrimColor: Color(0x66000000),
      ),
      cardTheme: const CardTheme(
        color: Color(0xFF00695C),
        margin: EdgeInsets.all(16),
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
        foregroundColor: Color(0xFFFFFFFF),
      ),
    );
  }
