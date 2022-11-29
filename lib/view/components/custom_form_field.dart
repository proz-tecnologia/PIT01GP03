import 'package:flutter/material.dart';
import 'package:projeto_flutter/view/themes/app_colors.dart';

class CustomFormField extends StatefulWidget {
  final String customFormField;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

// TODO: Verificar se os nomes suffixIcon e obscureText podem dar conflito por serem reservados do flutter
// TODO: rever nome "validator", pode ser nome reservado do flutter

  const CustomFormField(
      {super.key,
      required this.customFormField,
      this.suffixIcon,
      this.obscureText,
      this.controller,
      this.validator});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      maxLines: 1,
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        hintText: widget.customFormField,
        suffixIcon: widget.suffixIcon,
        errorStyle: const TextStyle(
            color: AppColors.orange, fontWeight: FontWeight.bold),
        hintStyle: const TextStyle(color: AppColors.linear),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.orange, width: 3),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.orange),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.linear, width: 2),
        ),
      ),
    );
  }
}
