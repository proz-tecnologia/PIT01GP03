import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:porkinio/app/features/sign_up/sign_up_state.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:porkinio/app/services/secure_storage.dart';

class SignUpController extends ChangeNotifier {
  final AuthService _service; 
  final  SecureStorage _secureStorage;

  SignUpController(this._service, this._secureStorage);

  late SignUpState _state = SignUpInitialState();

  SignUpState get state => _state;

  void _updateState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> doSignUp(
      {required String name,
      required String email,
      required String password}) async {
   
    _updateState(
      SignUpLoadingState(),
    );

    try {
      final user = await _service.signUp(
        name: name,
        email: email,
        password: password,
      );
      if (user.id != null) {
        await _secureStorage.write(
          key: "CURRENT_USER",
          value: user.toJson(),
        );
        _updateState(
          SignUpSucessState(),
        );
      } else {
        throw Exception();
      }

      log('usuario criado com sucesso');
      _updateState(
        SignUpSucessState(),
      );
    } catch (e) {
      _updateState(
        SignUpErrorState(
          e.toString(),
        ),
      );
    }
  }
}
