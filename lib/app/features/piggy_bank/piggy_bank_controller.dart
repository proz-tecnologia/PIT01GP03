import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_model.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_card_state.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:porkinio/locator.dart';

class PiggyBankController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  PiggyBankCardState _piggyBankCardState = PiggyBankCardInitialState();
  PiggyBankCardState get state => _piggyBankCardState;

  void _updateState(PiggyBankCardState newState) {
    _piggyBankCardState = newState;
    notifyListeners();
  }

  Future createPiggyBank(PiggyBankModel piggyBank) async {
    final newPiggyBank = _firestore.collection('piggy_bank').doc();
    piggyBank.id = newPiggyBank.id;
    piggyBank.userId = locator.get<AuthService>().currentUser!.uid;
    await newPiggyBank.set(
      piggyBank.toJson(),
    );
    _updateState(
      PiggyBankCardSuccessState(),
    );
  }

  Future<List<PiggyBankModel>> readPiggyBankList() async {
    final snapshot = await _firestore
        .collection("piggy_bank")
        .where("userId", isEqualTo: locator.get<AuthService>().currentUser?.uid)
        .get();

    final piggyBankList = List<PiggyBankModel>.from(
      snapshot.docs.map(
        (doc) => PiggyBankModel.fromJson(
          doc.data(),
        ),
      ),
    ).toList();

    return piggyBankList;
  }

  Stream<List<PiggyBankModel>> streamPiggyBankList() {
    return _firestore
        .collection('piggy_bank')
        .where('userId', isEqualTo: locator.get<AuthService>().currentUser?.uid)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => PiggyBankModel.fromJson(
                  doc.data(),
                ),
              )
              .toList(),
        );
  }

  Future updatePiggyBank(PiggyBankModel piggyBank) async {
    piggyBank.userId = locator.get<AuthService>().currentUser!.uid;
    await _firestore.collection('piggy_bank').doc(piggyBank.id).set(
          piggyBank.toMap(),
        );
    notifyListeners();
  }

  Future deletePiggyBank(PiggyBankModel piggyBank) async {
    try {
      _updateState(
        PiggyBankCardLoadingState(),
      );
      final id = piggyBank.id;
      final documentId = _firestore.doc("piggy_bank/$id");
      await documentId.delete();
      _updateState(
        PiggyBankCardSuccessState(),
      );
    } catch (e) {
      _updateState(
        PiggyBankCardErrorState(),
      );
    }
  }
}
