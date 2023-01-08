abstract class AccountBalanceCardState {}

class AccountBalanceCardInitialState extends AccountBalanceCardState {}

class AccountBalanceCardLoadingState extends AccountBalanceCardState {}

class AccountBalanceCardSuccessState extends AccountBalanceCardState {}

class AccountBalanceCardErrorState extends AccountBalanceCardState {
  final String message;
  AccountBalanceCardErrorState(this.message);
 
}