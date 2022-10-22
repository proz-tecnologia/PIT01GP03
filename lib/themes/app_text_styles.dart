import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_flutter/themes/app_colors.dart';

class TextStyles {
  static final titleHome = GoogleFonts.openSans(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static final titleRegular = GoogleFonts.lexendDeca(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  static final titleBoldHeading = GoogleFonts.lexendDeca(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
}