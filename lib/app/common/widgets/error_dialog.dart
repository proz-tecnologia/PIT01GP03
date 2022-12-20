import 'package:flutter/material.dart';
import 'package:porkinio/app/common/constants/app_colors.dart';

Future<void> errorDialog(
    BuildContext context, String customErrorMessage, String route, String buttom) async {
  return await showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        textAlign: TextAlign.center,
        customErrorMessage,
        style: const TextStyle(fontSize: 16, color: AppColors.backgroundDark),
      ),
      actions: <Widget>[
        Center(
          child: TextButton(
            onPressed: () => Navigator.of(context).pushReplacementNamed(route),
            child: Text(buttom,
              
              textAlign: TextAlign.center,
              
              style: const TextStyle(
                fontSize: 18,
                color: AppColors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
