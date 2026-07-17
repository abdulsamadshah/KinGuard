import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kinguard/features/auth/controllers/login_controller.dart';

final loginControllerProvider =
    StateNotifierProvider<LoginController, AsyncValue<void>>(
      (ref) => LoginController(ref),
    );
