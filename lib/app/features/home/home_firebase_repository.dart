import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:porkinio/app/models/transaction_model.dart';

abstract class HomeRepository {
  Future<List<TransactionModel>> getTransactionModel(String userID);
}

class HomeFirebaseRepository implements HomeRepository {

  final _firestore = FirebaseFirestore.instance;

  @override
  Future<List<TransactionModel>> getTransactionModel(String userID) async {
    final result = await _firestore
        .collection('transactionCRUD')
        .where('userID', isEqualTo: userID)
        .get();
    print(result);
    return [];
  }

  
}
