import 'package:flutter/material.dart';
import 'package:porkinio/app/common/widgets/custom_form_field.dart';

class PasswordFormField extends StatefulWidget {
  final String? text;
  final String? labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? helperText;

  const PasswordFormField({
    Key? key,
    this.text,
    this.labelText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.helperText,
  }) : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      text: widget.text,
      labelText: widget.labelText,
      obscureText: _isHidden,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      helperText: widget.helperText,
      suffixIcon: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () {
          setState(
            () {
              _isHidden = !_isHidden;
            },
          );
        },
        child: Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
      ),
    );
  }
}
