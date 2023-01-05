import 'package:porkinio/app/models/transaction_model.dart';

abstract class HomeState {}

class HomeInitialState implements HomeState {}

class HomeLogoutState implements HomeState {}

class HomeLoadingState implements HomeState {}

class HomeSuccessState implements HomeState {
  final List<TransactionModel> transactionModel;

  HomeSuccessState(this.transactionModel);
}

class HomeErrorState implements HomeState {}