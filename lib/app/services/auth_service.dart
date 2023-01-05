import 'package:firebase_auth/firebase_auth.dart';
import 'package:porkinio/app/models/user_model.dart';

abstract class AuthService {
  Future<UserModel> signUp(
      {String? name, required String email, required String password});

  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> forgotPassword(String email);

  User? get currentUser;
}
