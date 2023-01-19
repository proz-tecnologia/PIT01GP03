import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/features/goals_card/goals_card_model.dart';
import 'package:porkinio/app/features/goals_card/goals_card_state.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:porkinio/locator.dart';

class GoalsCardController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  GoalsCardState _goalsCardState = GoalsCardInitialState();
  GoalsCardState get state => _goalsCardState;

  void _updateState(GoalsCardState newState) {
    _goalsCardState = newState;
    notifyListeners();
  }

  Future createGoal(GoalsCardModel goal) async {
    final newGoal = _firestore.collection('goals').doc();
    goal.id = newGoal.id;
    goal.userId = locator.get<AuthService>().currentUser!.uid;
    await newGoal.set(
      goal.toJson(),
    );
    _updateState(
      GoalsCardSuccessState(),
    );
  }

  Future<List<GoalsCardModel>> readGoalsList() async {
    final snapshot = await _firestore
        .collection("goals")
        .where("userId", isEqualTo: locator.get<AuthService>().currentUser?.uid)
        .get();

    final goalsList = List<GoalsCardModel>.from(
      snapshot.docs.map(
        (doc) => GoalsCardModel.fromJson(
          doc.data(),
        ),
      ),
    ).toList();

    return goalsList;
  }

  Stream<List<GoalsCardModel>> readAllGoals() {
    return _firestore
        .collection('goals')
        .where('userId', isEqualTo: locator.get<AuthService>().currentUser?.uid)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => GoalsCardModel.fromJson(
                  doc.data(),
                ),
              )
              .toList(),
        );
  }

  Future updateGoal(GoalsCardModel goal) async {
    goal.userId = locator.get<AuthService>().currentUser!.uid;
    await _firestore.collection('goals').doc(goal.id).set(
          goal.toMap(),
        );
    notifyListeners();
  }

  Future deleteGoal(GoalsCardModel goal) async {
    try {
      _updateState(
        GoalsCardLoadingState(),
      );
      final id = goal.id;
      final documentId = _firestore.doc("transactionDB/$id");
      await documentId.delete();
      _updateState(
        GoalsCardSuccessState(),
      );
    } catch (e) {
      _updateState(
        GoalsCardErrorState(),
      );
    }
  }
}
