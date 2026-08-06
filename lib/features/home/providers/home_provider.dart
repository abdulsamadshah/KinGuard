import 'package:flutter_riverpod/legacy.dart';
import 'package:kinguard/features/home/controllers/homeController.dart';
import 'package:kinguard/features/home/state/home_state.dart';

final homeProvider = StateNotifierProvider<HomeController, HomeState>(
  (ref) => HomeController(ref),
);
