import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const linear = Color(0xFFE4E4E4);
  static const white = Color(0xFFFEFEFE);
  static const lightgreen = Color(0xFF0C6D5F);
  static const orange = Color(0xFFF79C32);
  static const green = Color(0xFF084237);
  static const ligthBlue = Color(0xFF42BFED);
  static const pink = Color(0xFFFB6EAF);
  static const primary = Color(0xFF00796B);
  static const primaryLight = Color(0xFF48A999);
  static const primaryDark = Color(0xFF004C40);
  static const secondary = Color(0xFFF9A825);
  static const secondaryLight = Color(0xFFFFD95A);
  static const secondaryDark = Color(0xFFC17900);
  static const textLight = Color(0xFFFEFEFE);
  static const textLightGray = Color(0xFFEAEAEA);
  static const textMediumGray = Color(0xFF747474);
  static const textDarkGray = Color(0xFF2B2B2B);
  static const backgroundLight = Color(0xFFFEFEFE);
  static const backgroundDark = Color(0xFF334546);
  static const accent = Color(0xFFFF62B2);
  static const accentLight = Color(0xFFFFC5C5);
  static const errorColor = Color(0xFFFF5555);
}

ThemeData theme = ThemeData(
  primarySwatch: Colors.teal,
  brightness: Brightness.light,
);

ThemeData newtheme = theme.copyWith(
  colorScheme: theme.colorScheme.copyWith(
    onPrimary: const Color(0xFFFFFFFF),
    secondary: const Color(0xFFFF9100),
  ),
  textTheme: theme.textTheme.copyWith(
    button: GoogleFonts.getFont(
      'Anton',
      textStyle: theme.textTheme.button,
    ),
    caption: GoogleFonts.getFont(
      'Sora',
      textStyle: theme.textTheme.caption,
    ),
    overline: GoogleFonts.getFont(
      'Sora',
      textStyle: theme.textTheme.caption,
    ),
    bodyText1: GoogleFonts.getFont(
      'Roboto',
      textStyle: theme.textTheme.bodyText1,
    ),
    bodyText2: GoogleFonts.getFont(
      'Roboto',
      textStyle: theme.textTheme.bodyText2,
    ),
    headline1: GoogleFonts.getFont(
      'Anton',
      textStyle: theme.textTheme.headline1,
    ),
    headline2: GoogleFonts.getFont(
      'Anton',
      textStyle: theme.textTheme.headline2,
    ),
    headline3: GoogleFonts.getFont(
      'Anton',
      textStyle: theme.textTheme.headline3,
    ),
    headline4: GoogleFonts.getFont(
      'Anton',
      textStyle: theme.textTheme.headline4,
    ),
    headline5: GoogleFonts.getFont(
      'Anton',
      textStyle: theme.textTheme.headline5,
    ),
    headline6: GoogleFonts.getFont(
      'Anton',
      textStyle: theme.textTheme.headline6,
    ),
    subtitle1: GoogleFonts.getFont(
      'Anton',
      textStyle: theme.textTheme.subtitle1,
    ),
    subtitle2: GoogleFonts.getFont(
      'Anton',
      textStyle: theme.textTheme.subtitle2,
    ),
  ),
  cardTheme: theme.cardTheme.copyWith(
    color: const Color(0xFF00695C),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      side: BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      )
    ),
  ), appBarTheme: theme.appBarTheme.copyWith(
    elevation: 0.0,
    color: const Color(0xFF004d40),
  )
);
