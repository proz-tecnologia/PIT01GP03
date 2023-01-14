abstract class AccountRecoveryState {}

class AccountRecoveryInitialState extends AccountRecoveryState {}

class AccountRecoveryLoadingState extends AccountRecoveryState {}

class AccountRecoverySuccessState extends AccountRecoveryState {}

class AccountRecoveryErrorState extends AccountRecoveryState {
  final String message;
  AccountRecoveryErrorState(this.message);
}
