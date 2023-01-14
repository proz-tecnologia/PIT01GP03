import 'package:flutter/material.dart';
import 'package:porkinio/app/features/account_recovery/account_recovery_state.dart';
import 'package:porkinio/app/services/firebase_auth_service.dart';

class AccountRecoveryController extends ChangeNotifier {
  final _firebaseAuthService = FirebaseAuthService();
  late String infoMessage;

  AccountRecoveryState _accountRecoveryState = AccountRecoveryInitialState();
  AccountRecoveryState get state => _accountRecoveryState;

  void _updateState(AccountRecoveryState newState) {
    _accountRecoveryState = newState;
    notifyListeners();
  }

  Future<void> forgotPassword(String email) async {
    try {
      await _firebaseAuthService.forgotPassword(email);
      infoMessage =
          'O Reset da senha foi enviado para o seu e-mail. Clique em Login para entrar com a nova senha.';
      _updateState(
        AccountRecoverySuccessState(),
      );
    } catch (e) {
      _updateState(
        AccountRecoveryErrorState("Erro, tente novamente"),
      );
    }
  }
}
