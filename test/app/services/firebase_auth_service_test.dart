// ignore_for_file: unused_import
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:porkinio/app/models/user_model.dart';
import 'mock_classes.dart';
import 'package:porkinio/app/services/firebase_auth_service.dart';

void main() {
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel user;

  setUp(() {
    mockFirebaseAuthService = MockFirebaseAuthService();
    user = UserModel(
      id: '152fie24vp',
      name: 'User',
      email: 'user@email.com',
    );
  });

  group(
    'Test sing up',
    () {
      test('Test sing up success', () async {
        when(
          () => mockFirebaseAuthService.signUp(
            name: 'User',
            email: 'user@email.com',
            password: '123456Ab',
          ),
        ).thenAnswer((_) async => user);

        final result = await mockFirebaseAuthService.signUp(
          name: 'User',
          email: 'user@email.com',
          password: '123456Ab',
        );

        expect(result, user);
      });

      test('Test sing up failure', () async {
        when(
          () => mockFirebaseAuthService.signUp(
            name: 'User',
            email: 'user@email.com',
            password: '123456Ab',
          ),
        ).thenThrow(Exception());

        expect(
            () => mockFirebaseAuthService.signUp(
                  name: 'User',
                  email: 'user@email.com',
                  password: '123456Ab',
                ),
            throwsException);
      });
    },
  );
}
