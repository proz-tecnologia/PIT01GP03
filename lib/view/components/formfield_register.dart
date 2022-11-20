import 'package:flutter/material.dart';
import 'package:projeto_flutter/view/themes/app_colors.dart';

class FormRegister extends StatelessWidget {
  final String textRegister;
  final Widget? suffixIcon;
  final bool? obscureText;


  const FormRegister(
      {super.key,
      required this.textRegister,
      this.suffixIcon,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    
      controller: null,
      maxLines: 1,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: textRegister,
        suffixIcon: suffixIcon,
        hintStyle: const TextStyle(color: AppColors.linear),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.orange, width: 3),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.pink),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.linear, width: 2),
        ),
      ),
    );
  }
}
