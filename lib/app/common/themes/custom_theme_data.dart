import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';

ThemeData customThemeData() {
  return ThemeData(
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
      color: AppColors.secondary,
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
          color: Colors.white,
          style: BorderStyle.solid,
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      color: AppColors.primaryDark,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 10,
      backgroundColor: AppColors.primaryDark,
      foregroundColor: Color(0xFFFFFFFF),
    ),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      dense: true,
    ),
  );
}
