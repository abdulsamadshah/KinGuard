import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kinguard/Routes/app_route_config.dart';
import 'package:kinguard/Routes/app_route_constants.dart';
import 'package:kinguard/core/values/Utils.dart';
import 'package:kinguard/features/auth/services/auth_service.dart';

class LoginController extends StateNotifier<AsyncValue<void>> {
  LoginController(this.ref) : super(const AsyncData(null));

  final Ref ref;

  Future<void> sendOtp(String phone, String countryCode) async {
    state = const AsyncLoading();

    try {
      var result = await ref.read(authServiceProvider).sendOtp(phone: phone);

      if (result.status == true) {
        Utils.flutterToast(result.message.toString());
        appRouter.router.pushNamed(
          RouteConstants.otpScreen,
          pathParameters: {
            'mobNo': phone,
          },
          queryParameters: {
            'countryCode': countryCode,
          },
        );
      } else {
        Utils.flutterToast(result.message.toString());
        state = const AsyncData(null);
      }
    } catch (e) {
      Utils.flutterToast(e.toString());
      state = const AsyncData(null);
    }
  }
}
