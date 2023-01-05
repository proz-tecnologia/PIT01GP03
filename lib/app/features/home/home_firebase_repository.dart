import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:porkinio/app/features/home/home_repository.dart';
import 'package:porkinio/app/models/transaction_model.dart';

class HomeFirebaseRepository implements HomeRepository {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<List<TransactionModel>> getTransactionDB(String id)  async {
    final result = await _firestore.collection("transactionTest").where("id", isEqualTo: id).get();
      print('*'*30);
      print(result);
     print(result.docs);
     result.docs.forEach(print);
     result.docs.forEach((doc) {
       print(doc.id);
       print(doc.data());
       print('*'*30);
     });
    final transactionList = List<TransactionModel>.from(result.docs.map((doc) => TransactionModel.fromMap(doc.id, doc.data())));
    return transactionList;
  }

}