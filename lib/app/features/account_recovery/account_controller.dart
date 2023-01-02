
import 'package:porkinio/app/services/firebase_auth_service.dart';

class AccountController {
  final _firebaseAuthService = FirebaseAuthService();

  Future<void> forgotPassword(String email) async {
    await _firebaseAuthService.forgotPassword(email);
    //TODO CHARLESTON TRABALHAR EXCEÇÃO
  }
}
  