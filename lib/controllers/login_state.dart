abstract class LoginState {}

// TODO: PAULO: VERIFICAR BOAS PRÁTICAS DE ARQUIVO DE CONTROLE DE ESTADOS;

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {}
