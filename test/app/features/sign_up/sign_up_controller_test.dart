import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:porkinio/app/features/sign_up/sign_up_controller.dart';
import 'package:porkinio/app/features/sign_up/sign_up_state.dart';
import 'package:porkinio/app/models/user_model.dart';
import '../../services/mock_classes.dart';

void main() {
  late SignUpController signUpController;
  late MockSecureStorage mockSecureStorage;
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel user;

  setUp(() {
    mockSecureStorage = MockSecureStorage();
    mockFirebaseAuthService = MockFirebaseAuthService();

    signUpController = SignUpController(
      mockFirebaseAuthService,
      mockSecureStorage,
    );

    user = UserModel(
      id: '152fie24vp',
      name: 'User',
      email: 'user@email.com',
    );
  });

  group('Test Sign Up Controller', () {
    test('Tests Sign Up Controller Sucess State', () async {
      expect(signUpController.state, isInstanceOf<SignUpInitialState>());

      when(() => mockSecureStorage.write(
            key: "CURRENT_USER",
            value: user.toJson(),
          )).thenAnswer((_) async {});

      when(
        () => mockFirebaseAuthService.signUp(
          name: 'User',
          email: 'user@email.com',
          password: '123456Ab',
        ),
      ).thenAnswer((_) async => user);

      await signUpController.doSignUp(
        name: 'User',
        email: 'user@email.com',
        password: '123456Ab',
      );
      expect(signUpController.state, isInstanceOf<SignUpSucessState>());
    });

    test('Tests Sign Up Controller Error State', () async {
      expect(signUpController.state, isInstanceOf<SignUpInitialState>());

      when(() => mockSecureStorage.write(
            key: "CURRENT_USER",
            value: user.toJson(),
          )).thenAnswer((_) async {});

      when(
        () => mockFirebaseAuthService.signUp(
          name: 'User',
          email: 'user@email.com',
          password: '123456Ab',
        ),
      ).thenThrow(
        Exception(),
      );

      await signUpController.doSignUp(
        name: 'User',
        email: 'user@email.com',
        password: '123456Ab',
      );
      expect(signUpController.state, isInstanceOf<SignUpErrorState>());
    });
  });
}
