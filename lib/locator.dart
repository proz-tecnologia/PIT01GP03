import 'package:porkinio/app/features/account_balance_card/account_balance_card_controller.dart';
import 'package:porkinio/app/features/sign_in/sign_in_controller.dart';
import 'package:porkinio/app/features/sing_up/sign_up_controller.dart';
import 'package:porkinio/app/features/splash/splash_controller.dart';
import 'package:porkinio/app/features/transaction_list/transaction_list_controller.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:porkinio/app/services/secure_storage.dart';
import 'app/services/firebase_auth_service.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>(
    () => FirebaseAuthService(),
  );

  locator.registerFactory<SplashController>(
    () => SplashController(
      const SecureStorage(),
    ),
  );

  locator.registerFactory<SingInController>(
    () => SingInController(
      locator.get<AuthService>(),
      const SecureStorage()
    ),
  );

  locator.registerFactory<SignUpController>(
    () => SignUpController(
      locator.get<AuthService>(),
      const SecureStorage(),
    ),
  );

  locator.registerLazySingleton<TransactionListController>(
    () => TransactionListController(),
  );

  locator.registerLazySingleton<AccountBalanceCardController>(
    () => AccountBalanceCardController(),
  );
}
