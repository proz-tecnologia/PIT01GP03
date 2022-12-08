import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:porkinio/app/features/sing_up/sign_up_state.dart';
import 'package:porkinio/app/services/auth_service.dart';

class SignUpController extends ChangeNotifier {
  final AuthService _service;
  SignUpController(this._service);
  
  late SignUpState _state = SignUpInitialState();

  SignUpState get state => _state;

  void _updateState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> doSignUp({
      required String name,
      required String email,
      required String password
      }) async {
    _updateState(SignUpLoadingState());
    try {
      await _service.signUp(
        name: name,
        email: email,
        password: password,
      );
  //    throw Exception('Erro ao cadastrar');

      log('usuario criado com sucesso');
      _updateState(SignUpSucessState());

    } catch (e) {
      _updateState(SignUpErrorState(e.toString()));
    }
  }
}
