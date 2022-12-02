import 'package:flutter/material.dart';
import 'package:porkinio/view/themes/app_colors.dart';

class CustomFormField extends StatefulWidget {
  final String formFieldText;
  final Widget? formFieldSuffixIcon;
  final bool? formFieldObscureText;
  final TextEditingController? formFieldController;
  final String? Function(String?)? formFieldValidator;

  const CustomFormField(
      {super.key,
      required this.formFieldText,
      this.formFieldSuffixIcon,
      this.formFieldObscureText,
      this.formFieldController,
      this.formFieldValidator});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.formFieldController,
      validator: widget.formFieldValidator,
      maxLines: 1,
      obscureText: widget.formFieldObscureText ?? false,
      decoration: InputDecoration(
        hintText: widget.formFieldText,
        suffixIcon: widget.formFieldSuffixIcon,
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
