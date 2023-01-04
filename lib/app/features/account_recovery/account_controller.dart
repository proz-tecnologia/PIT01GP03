import 'package:flutter/material.dart';
import 'package:porkinio/app/services/firebase_auth_service.dart';

class AccountController extends ChangeNotifier {
  final _firebaseAuthService = FirebaseAuthService();

 late String infoMessage;

  

  Future<void> forgotPassword(String email) async {
    try {
      await _firebaseAuthService.forgotPassword(email);      
      infoMessage = 'Reset de senha enviado para o seu e-mail';
    } catch (e) {
      infoMessage = 'Error, tente novamente';
    }
    notifyListeners();
  }
}
