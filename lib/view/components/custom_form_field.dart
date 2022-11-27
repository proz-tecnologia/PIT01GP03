import 'package:flutter/material.dart';
import 'package:projeto_flutter/view/themes/app_colors.dart';

class CustomFormField extends StatelessWidget {
  final String customFormField;
  final Widget? suffixIcon;
  final bool? obscureText;

// TODO: Verificar se os nomes suffixIcon e obscureText podem dar conflito por serem reservados do flutter

  const CustomFormField(
      {super.key,
      required this.customFormField,
      this.suffixIcon,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: null,
      maxLines: 1,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: customFormField,
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
