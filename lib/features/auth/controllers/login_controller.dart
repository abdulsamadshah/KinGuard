import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kinguard/features/auth/services/auth_service.dart';

class LoginController extends StateNotifier<AsyncValue<void>> {
  LoginController(this.ref) : super(const AsyncData(null));

  final Ref ref;

  Future<void> sendOtp(String phone) async {
    state = const AsyncLoading();

    try {
      print("=========PhoneDetail=====${phone}");
      // await ref.read(authServiceProvider).sendOtp(phone);

      state = const AsyncData(null);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }
}
