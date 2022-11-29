import 'package:flutter/material.dart';
import 'package:projeto_flutter/view/components/custom_form_field.dart';

//TODO checar o nome dessa pasta Paulo deu conflito quando eu fiz merge da sua branch local para a minha local
class FormRegisterPassword extends StatefulWidget {
  final String textRegister;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const FormRegisterPassword({
    Key? key,
    required this.textRegister,
    // TODO: rever nomenclatura
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
    return CustomFormField(
      validator: widget.validator,
      controller: widget.controller,
      // TODO: adicionar nome do campo
      // TODO: arredondar campo de escrita ao clicar
      // decoration: InputDecoration(
      //   errorStyle: const TextStyle(
      //       color: AppColors.orange, fontWeight: FontWeight.bold),
      //   errorBorder: const OutlinedInputBorder(
      //     borderSide: BorderSide(color: AppColors.orange),
      //   ),
      //   enabledBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(50),
      //     borderSide: BorderSide(color: AppColors.linear, width: 2),
      //   ),
      // ),
      customFormField: widget.textRegister,
      obscureText: _isHidden,
      suffixIcon: InkWell(
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
