import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_model.dart';
import 'package:porkinio/app/features/piggy_bank/piggy_bank_card_state.dart';
import 'package:porkinio/app/features/virtual_wallet/virtual_wallet_controller.dart';
import 'package:porkinio/app/features/virtual_wallet/virtual_wallet_model.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:porkinio/locator.dart';

class PiggyBankController extends VirtualWalletController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  PiggyBankCardState _piggyBankCardState = PiggyBankCardInitialState();
  PiggyBankCardState get piggyBankCardState => _piggyBankCardState;

  void _updateState(PiggyBankCardState newState) {
    _piggyBankCardState = newState;
    notifyListeners();
  }

  Future createPiggyBank(PiggyBankModel piggyBank) async {
    try {
      _updateState(
        PiggyBankCardLoadingState(),
      );
      final newPiggyBank = _firestore.collection('piggy_bank').doc();
      piggyBank.id = newPiggyBank.id;
      piggyBank.userId = locator.get<AuthService>().currentUser!.uid;
      await newPiggyBank.set(
        piggyBank.toJson(),
      );
      _updateState(
        PiggyBankCardSuccessState(),
      );
      notifyListeners();
      _updateState(
        PiggyBankCardSuccessState(),
      );
    } catch (e) {
      _updateState(
        PiggyBankCardErrorState(),
      );
    }
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
    try {
      _updateState(
        PiggyBankCardLoadingState(),
      );
      piggyBank.userId = locator.get<AuthService>().currentUser!.uid;
      await _firestore.collection('piggy_bank').doc(piggyBank.id).set(
            piggyBank.toMap(),
          );
      notifyListeners();
      _updateState(
        PiggyBankCardSuccessState(),
      );
    } catch (e) {
      _updateState(
        PiggyBankCardErrorState(),
      );
    }
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

  Future readBalance(VirtualWalletModel wallet) async {
    try {
      _updateState(
        PiggyBankCardLoadingState(),
      );
      await getBalance(wallet);
      final queryBalance = _firestore
          .collection('wallet')
          .doc('${locator.get<AuthService>().currentUser!.uid}/balance');
      final snapshotBalance = await queryBalance.get();

      if (snapshotBalance.exists) {
        wallet.income = snapshotBalance.data()?.entries.first.value;
      }
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
