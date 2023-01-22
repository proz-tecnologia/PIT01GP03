import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:porkinio/app/features/sign_in/sign_in_controller.dart';
import 'package:porkinio/app/features/sign_in/sign_in_state.dart';
import 'package:porkinio/app/models/user_model.dart';
import '../../services/mock_classes.dart';

void main() {
  late SignInController signInController;
  late MockSecureStorage mockSecureStorage;
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel user;

  setUp(() {
    mockSecureStorage = MockSecureStorage();
    mockFirebaseAuthService = MockFirebaseAuthService();

    signInController = SignInController(
      mockFirebaseAuthService,
      mockSecureStorage,
    );

    user = UserModel(
      id: '152fie24vp',
      name: 'User',
      email: 'user@email.com',
    );
  });

  group('Test Sign In Controller', () {
    test('Tests Sign In Controller Sucess State', () async {
      expect(signInController.state, isInstanceOf<SignInInitialState>());

      when(() => mockSecureStorage.write(
            key: "CURRENT_USER",
            value: user.toJson(),
          )).thenAnswer((_) async {});

      when(
        () => mockFirebaseAuthService.signIn(
          email: 'user@email.com',
          password: '123456Ab',
        ),
      ).thenAnswer((_) async => user);

      await signInController.doLogin(
        email: 'user@email.com',
        password: '123456Ab',
      );
      expect(signInController.state, isInstanceOf<SignInSuccessState>());
    });

    test('Tests Sign In Controller Error State', () async {
      expect(signInController.state, isInstanceOf<SignInInitialState>());

      when(() => mockSecureStorage.write(
            key: "CURRENT_USER",
            value: user.toJson(),
          )).thenAnswer((_) async {});

      when(
        () => mockFirebaseAuthService.signIn(
          email: 'user@email.com',
          password: '123456Ab',
        ),
      ).thenThrow(
        Exception(),
      );

      await signInController.doLogin(
        email: 'user@email.com',
        password: '123456Ab',
      );
      expect(signInController.state, isInstanceOf<SignInErrorState>());
    });
  });
}
