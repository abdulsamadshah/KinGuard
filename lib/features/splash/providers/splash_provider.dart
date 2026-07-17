import 'package:flutter_riverpod/legacy.dart';
import '../viewmodels/splash_view_model.dart';

final splashProvider = StateNotifierProvider<SplashViewModel, SplashState>((
  ref,
) {
  return SplashViewModel();
});
