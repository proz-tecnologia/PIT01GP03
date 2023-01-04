import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/features/home/home_firebase_repository.dart';


class HomeController extends ChangeNotifier {
  

  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);

  final _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  Future<void> getTransactions() async {
    try {
      final userID = _auth.currentUser?.uid;
      final result = await _homeRepository.getTransactionModel(userID ?? '');
    } catch (e) {
      rethrow;
    }
  }
}


