import 'package:flutter/material.dart';
import 'package:porkinio/view/themes/app_colors.dart';


class FormRegister extends StatefulWidget {
  final String textRegister;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const FormRegister(
      {super.key,
      required this.textRegister,
      this.suffixIcon,
      this.obscureText,
      this.controller,
      this.validator});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      maxLines: 1,
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        errorStyle: const TextStyle(
            color: AppColors.orange, fontWeight: FontWeight.bold),
        hintText: widget.textRegister,
        
        suffixIcon: widget.suffixIcon,
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
