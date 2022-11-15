import 'package:flutter/material.dart';
import 'package:projeto_flutter/view/components/formfield_register.dart';

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
    return FormRegister(
      textRegister: widget.textRegister,
      obscureText: _isHidden,
      suffixIcon: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () {
            setState(() {
              _isHidden = !_isHidden;
            });
          },
          child: Icon( _isHidden ? Icons.visibility : Icons.visibility_off )),
    );
  }
}
