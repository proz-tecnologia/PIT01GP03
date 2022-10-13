import 'package:flutter/material.dart';

//TextFields

class CustomEmailTextField extends StatefulWidget {
  const CustomEmailTextField({super.key});

  @override
  State<CustomEmailTextField> createState() => _CustomEmailTextFieldState();
}

class _CustomEmailTextFieldState extends State<CustomEmailTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(0, 5),
            blurRadius: 5,
          )
        ],
      ),
      alignment: Alignment.center,
      child: const TextField(
        cursorColor: Color.fromARGB(255, 244, 193, 192),
        decoration: InputDecoration(
            icon: Icon(
              Icons.email,
              color: Color.fromARGB(255, 244, 193, 192),
            ),
            hintText: 'Email',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({super.key});

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(0, 5),
            blurRadius: 5,
          )
        ],
      ),
      alignment: Alignment.center,
      child: const TextField(
        obscureText: true,
        obscuringCharacter: '*',
        cursorColor: Color.fromARGB(255, 244, 193, 192),
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Color.fromARGB(255, 244, 193, 192),
            ),
            hintText: 'Password',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}

//TextFields

//Buttons

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 200, right: 20, top: 30),
        padding: const EdgeInsets.only(left: 10, right: 10),
        alignment: Alignment.center,
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromARGB(224, 160, 62, 62),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(0, 5),
              blurRadius: 5,
            )
          ],
        ),
        child: const Text(
          'LOGIN',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 2),
        ));
  }
}

//Buttons