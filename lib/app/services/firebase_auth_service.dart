import 'package:firebase_auth/firebase_auth.dart';
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
      if (e.code == 'user-not-found') {
        throw "Usuário não cadastrado";
      }
      if (e.code == 'wrong-password') {
        throw "E-mail ou senha incorretos";
      }
      throw "Erro ao logar";
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
}
