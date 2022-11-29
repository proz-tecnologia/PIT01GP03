import 'package:flutter/material.dart';
import 'package:projeto_flutter/view/components/custom_form_field.dart';

class PasswordFormField extends StatefulWidget {
  final String passwordFormField;
  final TextEditingController? customController;
  final String? Function(String?)? customValidator;

  const PasswordFormField(
      {Key? key,
      required this.passwordFormField,
      this.customController,
      this.customValidator})
      : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      customFormField: widget.passwordFormField,
      customObscureText: _isHidden,
      customSuffixIcon: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () {
            setState(() {
              _isHidden = !_isHidden;
            });
          },
          child: Icon(_isHidden ? Icons.visibility_off : Icons.visibility)),
    );
  }
}
