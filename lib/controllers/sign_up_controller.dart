import 'package:flutter/material.dart';
import 'package:porkinio/controllers/sign_up_state.dart';

class SignUpController extends ChangeNotifier {
  SignUpState state = SignUpInitialState();

  void updateState(SignUpState newState) {
    state = newState;
    notifyListeners();
  }

  Future<bool> doSignUp() async {
    updateState(SignUpLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 2));
      throw Exception('Erro ao cadastrar');
      // updateState(SignUpSucessState());
      // return true;
    } catch (e) {
      updateState(SignUpErrorState());
      return false;
    }
  }
}
