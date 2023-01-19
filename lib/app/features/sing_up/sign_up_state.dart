abstract class SignUpState {
  void dispose() {}
}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  final String message;
  SignUpErrorState(this.message);
}
