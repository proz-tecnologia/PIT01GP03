import 'package:flutter/material.dart';
import 'package:projeto_flutter/view/themes/app_colors.dart';

class CustomFormField extends StatefulWidget {
  final String customFormField;
  final Widget? customSuffixIcon;
  final bool? customObscureText;
  final TextEditingController? controller;
  final String? Function(String?)? customValidator;

  const CustomFormField(
      {super.key,
      required this.customFormField,
      this.customSuffixIcon,
      this.customObscureText,
      this.controller,
      this.customValidator});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.customValidator,
      maxLines: 1,
      obscureText: widget.customObscureText ?? false,
      decoration: InputDecoration(
        hintText: widget.customFormField,
        suffixIcon: widget.customSuffixIcon,
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
