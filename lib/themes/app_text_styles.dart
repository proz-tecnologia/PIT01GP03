import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_flutter/themes/app_colors.dart';

class MyTextStyles {
  static final titleHome = GoogleFonts.signikaNegative(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.orange,
  );
  static final titleRegular = GoogleFonts.lexendDeca(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static final titleBoldHeading = GoogleFonts.lexendDeca(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.linear,
  );
}
