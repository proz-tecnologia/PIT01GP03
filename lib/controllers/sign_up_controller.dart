import 'package:flutter/cupertino.dart';
import 'package:projeto_flutter/controllers/sign_up_state.dart';

class SignUpController {
  
  final state = ValueNotifier<SignUpStateController>(SignUpInitialState());

   Future<void> doSignUp() async {
    state.value = SignUpLoadingState();
    try {
      await Future.delayed(const Duration(seconds: 2));
     // throw Exception('Erro ao cadastrar');
      state.value = SignUpSucessState();
    } catch (e) {
       state.value = SignUpErrorState();
    }
  }

}


