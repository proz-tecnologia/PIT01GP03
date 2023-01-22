import 'package:flutter/material.dart';
import 'package:porkinio/app/features/sign_in/sign_in_state.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:porkinio/app/services/secure_storage.dart';

class SignInController extends ChangeNotifier {
  final AuthService _authservice;
  final SecureStorage _secureStorage;
  SignInController(this._authservice, this._secureStorage);
  SignInState _signInState = SignInInitialState();
  SignInState get state => _signInState;

  void _updateState(SignInState newState) {
    _signInState = newState;
    notifyListeners();
  }

  Future<void> doLogin(
      {required String email, required String password}) async {
    _updateState(
      SignInLoadingState(),
    );

    try {
      final user = await _authservice.signIn(
        email: email,
        password: password,
      );
      if (user.id != null) {
        _secureStorage.write(
          key: 'CURRENT_USER',
          value: user.toJson(),
        );
        _updateState(
          SignInSuccessState(),
        );
      } else {
        throw Exception("Usuário não cadastrado");
      }
    } catch (e) {
      _updateState(
        SignInErrorState(
          e.toString(),
        ),
      );
    }
  }
}
