import 'dart:developer';
import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/common/widgets/error_dialog.dart';
import 'package:porkinio/app/features/login/login_page.dart';

import 'package:porkinio/app/features/login/login_state.dart';
import 'package:porkinio/app/features/sing_up/sign_up_page.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:porkinio/app/services/secure_storage.dart';

class LoginController extends ChangeNotifier {
  final AuthService _authservice;

  LoginController(this._authservice);

  LoginState _loginState = LoginInitialState();

  LoginState get state => _loginState;

  void _updateState(LoginState newState) {
    _loginState = newState;
    notifyListeners();
  }

  Future<void> doLogin(
      {required String email, required String password}) async {
    const secureStorage = SecureStorage();
    _updateState(LoginLoadingState());

    try {
      final user = await _authservice.signIn(
        email: email,
        password: password,
      );
      if (user.id != null) {
        secureStorage.write(key: 'CURRENT_USER', value: user.toJson());
        _updateState(LoginSuccessState());
      }

      throw Exception();
    } catch (e) {
      _updateState(LoginErrorState(message: e.toString()));
    }
  }
}
