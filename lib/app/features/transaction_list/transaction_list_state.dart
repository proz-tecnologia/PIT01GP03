abstract class TransactionListState {
  void dispose() {}
}

class TransactionListInitialState extends TransactionListState {}

class TransactionListLoadingState extends TransactionListState {}

class TransactionListSucessState extends TransactionListState {}

class TransactionListErrorState extends TransactionListState {}
