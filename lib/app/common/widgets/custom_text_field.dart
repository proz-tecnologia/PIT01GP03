import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  
  final String textFieldName;
  final String? Function(String?)? textFieldValidator;
  final TextEditingController? textFieldController;

  const CustomTextField({
    super.key, 
    required this.textFieldName,
    this.textFieldValidator, 
    this.textFieldController, 
    });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      
      controller: widget.textFieldController,
      decoration: InputDecoration(
        labelText: widget.textFieldName
        
      ),
    
    );
  }
}