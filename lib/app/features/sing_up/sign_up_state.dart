abstract class SignUpState {
  void dispose() {}
}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSucessState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  final String message;
  SignUpErrorState(this.message);
}
