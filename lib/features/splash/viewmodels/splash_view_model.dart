import 'package:flutter_riverpod/legacy.dart';
import 'package:kinguard/core/utils/Global.dart';

enum SplashState { initial, loading, authenticated, unauthenticated }

class SplashViewModel extends StateNotifier<SplashState> {
  SplashViewModel() : super(SplashState.initial);

  Future<void> initializeApp() async {
    state = SplashState.loading;

    await Future.delayed(const Duration(seconds: 2));
    if (Global.storageServices.getTokenValue() != null) {
      state = SplashState.authenticated;
    } else {
      state = SplashState.unauthenticated;
    }
  }
}
