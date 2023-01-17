import 'package:flutter/material.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';

class CustomFormField extends StatefulWidget {
  final String? text;
  final String? labelText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? helperText;
  final bool? border;

  const CustomFormField({
    super.key,
    this.text,
    this.labelText,
    this.suffixIcon,
    this.obscureText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.helperText,
    this.border,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  final customDefaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.white),
  );

  String? _customHelperText;

  @override
  void initState() {
    super.initState();
    _customHelperText = widget.helperText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (value.length == 1) {
          setState(
            () {
              _customHelperText = null;
            },
          );
        } else if (value.isEmpty) {
          setState(
            () {
              _customHelperText = widget.helperText;
            },
          );
        }
      },
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      maxLines: 1,
      obscureText: widget.obscureText ?? false,
      decoration: widget.border == null
          ? InputDecoration(
              labelText: widget.labelText,
              helperText: _customHelperText,
              helperMaxLines: 3,
              hintText: widget.text,
              suffixIcon: widget.suffixIcon,
              focusedBorder: customDefaultBorder.copyWith(
                borderSide:
                    const BorderSide(color: AppColors.secondary, width: 2),
              ),
              errorBorder: customDefaultBorder.copyWith(
                borderSide: const BorderSide(color: AppColors.error, width: 2),
              ),
              enabledBorder: customDefaultBorder.copyWith(
                borderSide:
                    const BorderSide(color: AppColors.primaryDark, width: 2),
              ),
            )
          : InputDecoration(
              labelText: widget.labelText,
              helperText: _customHelperText,
              helperMaxLines: 3,
              hintText: widget.text,
              suffixIcon: widget.suffixIcon,
            ),
    );
  }
}
