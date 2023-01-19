import 'package:flutter/material.dart';

Future<void> customAuthDialog(BuildContext context, String customErrorMessage,
    String customMessageButton, String route) async {
  return await showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        textAlign: TextAlign.center,
        customErrorMessage,
        style: const TextStyle(fontSize: 16,),
      ),
      actions: <Widget>[
        Center(
          child: TextButton(
            onPressed: () => Navigator.of(context).pushReplacementNamed(route),
            child: Text(
              customMessageButton,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
