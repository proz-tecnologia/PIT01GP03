import 'package:flutter/material.dart';
import 'package:projeto_flutter/view/components/custom_form_field.dart';

//TODO checar o nome dessa pasta Paulo deu conflito quando eu fiz merge da sua branch local para a minha local  
class FormRegisterPassword extends StatefulWidget {
  final String textRegister;

  const FormRegisterPassword({
    Key? key,
    required this.textRegister,
  }) : super(key: key);

  @override
  State<FormRegisterPassword> createState() => _FormRegisterPasswordState();
}

class _FormRegisterPasswordState extends State<FormRegisterPassword> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      customFormField: widget.textRegister,
      obscureText: _isHidden,
      suffixIcon: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () {
            setState(() {
              _isHidden = !_isHidden;
            });
          },
          child: Icon( _isHidden ? Icons.visibility_off  : Icons.visibility)),
    );
  }
}
