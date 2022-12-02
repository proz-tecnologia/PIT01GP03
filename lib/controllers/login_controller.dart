import 'package:flutter/cupertino.dart';
import 'package:projeto_flutter/controllers/login_state.dart';


class LoginController extends ChangeNotifier {  
  LoginState state = LoginInitialState();

  void updateState(LoginState newState) {
    state = newState;
    notifyListeners();
  }

  Future<bool> doLogin() async {
    updateState(LoginLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 2));

     // throw Exception('Erro ao logar');
      updateState(LoginSucessState());
      return true;
    } catch (e) {
      updateState(LoginErrorState());
      return false;
    }
  }
}