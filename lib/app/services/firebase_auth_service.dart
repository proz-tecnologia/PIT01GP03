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
      switch (e.message) {
    case 'The email address is already in use by another account.':
      throw 'Email já foi cadastrado';

    case 'The password is invalid or the user does not have a password.':
      throw 'Sua senha está errada';

    case 'There is no user record corresponding to this identifier. The user may have been deleted.':
      throw 'Usuario não foi criado';

    case 'Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later.':
      throw 'Seu acesso está temporariamente indisponível devido às diversas tentativas de login. Resete a senha ou tente novamente mais tarde';

    default:
      throw 'Um erro indefinido ocorreu.';
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
}
