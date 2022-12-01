import 'package:flutter/material.dart';
import 'package:projeto_flutter/controllers/login_state.dart';

class LoginController extends ChangeNotifier {
  // TODO: CHARLESTON: TRANSFORMAR EM PROVIDER
  LoginState loginState = LoginInitialState();

  void updateState(LoginState newState) {
    loginState = newState;
    notifyListeners();
  }

  Future<bool> attemptLogin() async {
    updateState(LoginLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 2));

      //  throw Exception('Erro ao logar');
      // TODO: BEATRIZ & DIEGO: IMPLMENTAR OU DELETAR O THROW EXCEPTION ACIMA
      updateState(LoginSuccessState());
      return true;
    } catch (e) {
      updateState(LoginErrorState());
      return false;
    }
  }
}
