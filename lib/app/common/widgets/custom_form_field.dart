import 'package:flutter/material.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';

// TODO REVER COMPONENTIZAÇÃO

class CustomFormField extends StatefulWidget {
  final String? formFieldText;
  final String? formFieldLabelText;
  final Widget? formFieldSuffixIcon;
  final bool? formFieldObscureText;
  final TextEditingController? formFieldController;
  final String? Function(String?)? formFieldValidator;
  final TextInputType? formFieldKeyboardType;
  final String? formFieldHelperText;
  final bool? formFieldBorder;

  const CustomFormField({
    super.key,
    this.formFieldText,
    this.formFieldLabelText,
    this.formFieldSuffixIcon,
    this.formFieldObscureText,
    this.formFieldController,
    this.formFieldValidator,
    this.formFieldKeyboardType,
    this.formFieldHelperText,
    this.formFieldBorder,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  final customDefaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: AppColors.white),
  );

  String? _customHelperText;

  @override
  void initState() {
    super.initState();
    _customHelperText = widget.formFieldHelperText;
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
              _customHelperText = widget.formFieldHelperText;
            },
          );
        }
      },
      controller: widget.formFieldController,
      validator: widget.formFieldValidator,
      keyboardType: widget.formFieldKeyboardType,
      maxLines: 1,
      obscureText: widget.formFieldObscureText ?? false,
      decoration: widget.formFieldBorder == null
          ? InputDecoration(
              labelText: widget.formFieldLabelText,
              helperText: _customHelperText,
              helperMaxLines: 3,
              hintText: widget.formFieldText,
              suffixIcon: widget.formFieldSuffixIcon,
              hintStyle: const TextStyle(color: AppColors.linear),
              focusedBorder: customDefaultBorder.copyWith(
                borderSide: const BorderSide(color: AppColors.orange, width: 2),
              ),
              errorBorder: customDefaultBorder.copyWith(
                borderSide:
                    const BorderSide(color: AppColors.errorColor, width: 2),
              ),
              enabledBorder: customDefaultBorder.copyWith(
                borderSide:
                    const BorderSide(color: AppColors.backgroundDark, width: 2),
              ),
            )
          : InputDecoration(
              labelText: widget.formFieldLabelText,
              helperText: _customHelperText,
              helperMaxLines: 3,
              hintText: widget.formFieldText,
              suffixIcon: widget.formFieldSuffixIcon,
              hintStyle: const TextStyle(color: AppColors.linear),
            ),
    );
  }
}
