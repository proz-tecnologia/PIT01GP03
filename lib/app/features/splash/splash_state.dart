abstract class SplashState {
  void dispose() {}
}

class SplashInitialState extends SplashState {}

class SplashLoadingState extends SplashState {}

class SplashSuccessState extends SplashState {}

class SplashErrorState extends SplashState {}
