import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:porkinio/app/models/user_model.dart';
import 'package:porkinio/app/services/auth_service.dart';

class FirebaseAuthService implements AuthService {
  final _auth = FirebaseAuth.instance;

  @override
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (result.user != null) {
        return UserModel(
            name: _auth.currentUser?.displayName,
            email: _auth.currentUser!.email!,
            id: _auth.currentUser!.uid);
      } else {
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      switch (e.message) {
        case 'The email address is already in use by another account.':
          throw 'Esse e-mail já está associado a uma conta do Porkin.io. Verifique seus dados ou solicite a recuperação de conta.';

        case 'The password is invalid or the user does not have a password.':
          throw 'A combinação de senha e/ou e-mail inserida não é valida. Verifique os dados e tente novamente.';

        case 'There is no user record corresponding to this identifier. The user may have been deleted.':
          throw 'Conta de usuário não identificada. Verifique os dados e tente novamente.';

        case 'Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later.':
          throw 'O acesso a essa conta está temporariamente suspenso devido às diversas tentativas de entrada com dados inválidos. Solicite a recuperação de conta ou tente novamente mais tarde';

        default:
          throw 'Falha na tentativa de login. Encontramos um erro inesperado. Verifique seus dados ou tente novamente mais tarde.';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signUp(
      {String? name, required String email, required String password}) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        await result.user!.updateDisplayName(name);
        return UserModel(
            name: _auth.currentUser!.displayName,
            email: _auth.currentUser!.email!,
            id: _auth.currentUser!.uid);
      } else {
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "null";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      var loginMethods = await _auth.fetchSignInMethodsForEmail(email);

      if (loginMethods.contains('password')) {
        await _auth.sendPasswordResetEmail(email: email);
      } else {
        throw Exception();
      }
    } on PlatformException catch (e) {
      throw e.message ?? "null";
    }
  }

  @override
  User? get currentUser => _auth.currentUser;
}
