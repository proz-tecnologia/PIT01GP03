import 'package:flutter/material.dart';
import 'package:projeto_flutter/themes/app_colors.dart';

class FormRegister extends StatelessWidget {
  final String textRegister;

  const FormRegister({required this.textRegister, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: null,
      maxLines: null,
      decoration: InputDecoration(
          hintText: textRegister,
          hintStyle: const TextStyle(color: AppColors.linear),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(70),
              borderSide: const BorderSide(color: AppColors.linear, width: 3)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(70),
              borderSide: const BorderSide(color: AppColors.linear, width: 2))),
    );
  }
}
