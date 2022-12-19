import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:porkinio/app/features/login/login_state.dart';
import 'package:porkinio/app/services/auth_service.dart';

class LoginController extends ChangeNotifier {

  final AuthService _service;

  LoginController(this._service);

  LoginState _loginState = LoginInitialState();

  LoginState get state => _loginState;

  void _updateState(LoginState newState) {
    _loginState = newState;
    notifyListeners();
  }

  Future<void> doLogin(
      {required String email, required String password}) async {
    _updateState(LoginLoadingState());

    

      
    try {
      await _service.signUp(
        email: email,
        password: password,
      );

      //    throw Exception('Erro ao cadastrar');

      log('usuario logado com sucesso');
      _updateState(LoginSuccessState());
    } catch (e) {
      _updateState(LoginErrorState(e.toString()));
    }
  }
}
