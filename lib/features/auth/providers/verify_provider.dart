import 'package:flutter_riverpod/legacy.dart';
import 'package:kinguard/features/auth/controllers/verify_controller.dart';

import '../State/VerifyState.dart';

final verifyControllerProvider =
    StateNotifierProvider<VerifyController, VerifyState>(
      (ref) => VerifyController(ref),
    );
