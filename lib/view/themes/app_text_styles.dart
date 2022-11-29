import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_flutter/view/themes/app_colors.dart';

// TODO: PAULO: SEPARAR AS CLASSES EM ARQUIVOS DIFERENTES E PADRONIZAR ESTILOS
class AppTextStylesDark {
  static final headline1 = GoogleFonts.concertOne(
    fontSize: 96,
    color: AppColors.secondary,
  );
  static final headline2 = GoogleFonts.concertOne(
    fontSize: 60,
    color: AppColors.secondary,
  );
  static final headline3 = GoogleFonts.concertOne(
    fontSize: 48,
    color: AppColors.secondary,
  );
  static final headline3Geen = GoogleFonts.concertOne(
    fontSize: 48,
    color: AppColors.green,
  );
  static final headline4 = GoogleFonts.concertOne(
    fontSize: 34,
    color: AppColors.secondary,
  );
  static final headline5 = GoogleFonts.concertOne(
    fontSize: 24,
    color: AppColors.secondary,
  );
  static final headline6 = GoogleFonts.concertOne(
    fontSize: 20,
    color: AppColors.secondary,
  );
  static final subtitle1 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textLight,
  );
  static final subtitle2 = GoogleFonts.robotoCondensed(
    fontSize: 14,
    color: AppColors.secondary,
    fontWeight: FontWeight.bold,
  );
  static final body1 = GoogleFonts.roboto(
    fontSize: 16,
    color: AppColors.textDarkGray,
  );
  static final body2 = GoogleFonts.robotoCondensed(
    fontSize: 14,
    color: AppColors.textDarkGray,
  );
  static final button = GoogleFonts.roboto(
    fontSize: 14,
    color: AppColors.textDarkGray,
    fontWeight: FontWeight.bold,
  );
  static final caption = GoogleFonts.concertOne(
    fontSize: 12,
    color: AppColors.textDarkGray,
  );
  static final overline = GoogleFonts.robotoCondensed(
    fontSize: 10,
    color: AppColors.textDarkGray,
  );
}

class AppTextStylesLight {
  static final headline1 = GoogleFonts.concertOne(
    fontSize: 96,
    color: AppColors.textLight,
  );
  static final headline2 = GoogleFonts.concertOne(
    fontSize: 60,
    color: AppColors.textLight,
  );
  static final headline3 = GoogleFonts.concertOne(
    fontSize: 48,
    color: AppColors.textLight,
  );
  static final headline4 = GoogleFonts.concertOne(
    fontSize: 34,
    color: AppColors.textLight,
  );
  static final headline5 = GoogleFonts.concertOne(
    fontSize: 24,
    color: AppColors.textLight,
  );
  static final headline6 = GoogleFonts.concertOne(
    fontSize: 20,
    color: AppColors.textLight,
  );
  static final subtitle1 = GoogleFonts.roboto(
    fontSize: 16,
    color: AppColors.textLight,
    fontWeight: FontWeight.bold,
  );
  static final subtitle2 = GoogleFonts.robotoCondensed(
    fontSize: 14,
    color: AppColors.textLight,
    fontWeight: FontWeight.bold,
  );
  static final body1 = GoogleFonts.roboto(
    fontSize: 16,
    color: AppColors.textLight,
  );
  static final body2 = GoogleFonts.robotoCondensed(
    fontSize: 14,
    color: AppColors.textLight,
  );
  static final button = GoogleFonts.concertOne(
    fontSize: 14,
    color: AppColors.textLight,
  );
  static final caption = GoogleFonts.roboto(
    fontSize: 12,
    color: AppColors.textLight,
    fontWeight: FontWeight.bold,
  );
  static final overline = GoogleFonts.robotoCondensed(
    fontSize: 10,
    color: AppColors.textLight,
  );
}
