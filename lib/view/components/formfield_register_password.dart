import 'package:flutter/material.dart';
import 'package:projeto_flutter/view/themes/app_colors.dart';

class FormRegisterPassword extends StatefulWidget {
  final String textRegister;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const FormRegisterPassword({
    Key? key,
    required this.textRegister,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<FormRegisterPassword> createState() => _FormRegisterPasswordState();
}

class _FormRegisterPasswordState extends State<FormRegisterPassword> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: _isHidden,
        //TODO: adicionar nome do campo
        //TODO: arredondar campo de escrita ao clicar
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: AppColors.orange, fontWeight: FontWeight.bold),
          errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.orange),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.linear, width: 2),
        ),
          suffixIcon: InkWell(
              borderRadius: BorderRadius.circular(20.0),
              onTap: () {
                setState(() {
                  _isHidden = !_isHidden;
                });
              },
              child: Icon(_isHidden ? Icons.visibility_off : Icons.visibility)),
        ));
  }
}
