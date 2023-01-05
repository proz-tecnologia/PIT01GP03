import 'package:flutter/material.dart';
import 'package:porkinio/app/features/home/home_repository.dart';
import 'package:porkinio/app/features/home/home_state.dart';
import 'package:porkinio/app/services/auth_service.dart';

class HomeController extends ChangeNotifier {
  final AuthService _authService;
  final HomeRepository _homeRepository;

  HomeController(this._authService, this._homeRepository);

  HomeState _homeState = HomeInitialState();
  HomeState get state => _homeState;

  void _updateState(HomeState newState) {
    _homeState = newState;
    notifyListeners();
  }

  Future<void> getTransactions() async {
    try {
      final userID = _authService.currentUser?.uid;
      final result = await _homeRepository.getTransactionDB(userID ?? '');
      _updateState(HomeSuccessState(result));
    } catch (e) {
      _updateState(HomeErrorState());
    }
  }
}





