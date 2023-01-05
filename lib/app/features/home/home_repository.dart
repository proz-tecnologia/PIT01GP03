import 'package:porkinio/app/models/transaction_model.dart';

abstract class HomeRepository {
  Future<List<TransactionModel>> getTransactionDB(String userID);
}



