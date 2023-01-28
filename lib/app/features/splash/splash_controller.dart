import 'package:flutter/cupertino.dart';
import 'package:porkinio/app/features/splash/splash_state.dart';
import 'package:porkinio/app/services/secure_storage.dart';

class SplashController extends ChangeNotifier {
  final SecureStorage _service;
  SplashController(this._service);
  SplashState _state = SplashInitialState();
  SplashState get state => _state;

  void _updateState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  void isUserLogged() async {
    final result = await _service.readOne(key: "CURRENT_USER");
    if (result != null) {
      _updateState(
        SplashSuccessState(),
      );
    } else {
      _updateState(
        SplashErrorState(),
      );
    }
  }
}
