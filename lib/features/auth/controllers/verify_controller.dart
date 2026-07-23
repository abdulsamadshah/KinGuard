import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kinguard/Routes/app_route_config.dart';
import 'package:kinguard/Routes/app_route_constants.dart';
import 'package:kinguard/core/constants/bottomSheet/CreateProfileBottomSheet.dart';
import 'package:kinguard/core/constants/pref_res.dart';
import 'package:kinguard/core/utils/Global.dart';
import 'package:kinguard/core/utils/deep_Link/Context_Utility.dart';
import 'package:kinguard/core/values/Utils.dart';
import 'package:kinguard/core/values/utility.dart';
import 'package:kinguard/features/auth/State/VerifyState.dart';
import 'package:kinguard/features/auth/services/auth_service.dart';
import 'package:http_parser/http_parser.dart';

class VerifyController extends StateNotifier<VerifyState> {
  VerifyController(this.ref) : super(VerifyState());

  final Ref ref;

  Future<void> verifyOtp({
    required String phone,
    required String countryCode,
    required String otp,
  }) async {
    state = state.copyWith(loading: true);

    try {
      final param = {"MobileNo": phone, "countryCode": countryCode, "otp": otp};

      final result = await ref
          .read(authServiceProvider)
          .verifyOtp(param: param);
      if (result.status == true) {
        state = state.copyWith(loading: false);
        Global.storageServices.setString(
          PrefConst.STORAGE_USER_TOKEN_KEY,
          result.data!.token.toString(),
        );
        if (result.data?.isNewUser == true) {
          await CreateProfileBottomSheet.show(
            ContextUtility.navigatorkey.currentState!.context,
          );
        } else {
          appRouter.router.goNamed(RouteConstants.homeScreen);
        }
      } else {
        state = state.copyWith(loading: false);
        Utils.flutterToast(result.message.toString());
      }
    } catch (e) {
      state = state.copyWith(loading: false);
      Utils.flutterToast(e.toString());
    }
  }

  Future<void> register({required String userName}) async {
    state = state.copyWith(isLoadingRegister: true);

    try {
      FormData data = FormData.fromMap({
        'Name': userName,
        "ProfileImage": Utility.isNotNullEmptyOrFalse(state.profileImage)
            ? await MultipartFile.fromFile(
                state.profileImage.toString(),
                filename: state.profileImage.toString(),
                contentType: MediaType('image', 'jpeg'),
              )
            : "",
      });

      final result = await ref.read(authServiceProvider).register(data: data);
      if (result.status == true) {
        state = state.copyWith(isLoadingRegister: false);
        Utils.flutterToast("Personal Detail Updated Successfully");
        appRouter.router.goNamed(RouteConstants.homeScreen);
      } else {
        state = state.copyWith(isLoadingRegister: false);
        Utils.flutterToast(result.message.toString());
      }
    } catch (e) {
      state = state.copyWith(isLoadingRegister: false);
      Utils.flutterToast(e.toString());
    }
  }

  void profileImage({required String imagePath}) {
    state = state.copyWith(profileImage: imagePath);
  }


}

// class VerifyController extends StateNotifier<AsyncValue<void>> {
//   VerifyController(this.ref) : super(AsyncData(num));
//
//   final Ref ref;
//
//   Future<void> verifyOtp({
//     required String phone,
//     required String countryCode,
//     required String otp,
//   }) async {
//     state = const AsyncLoading();
//
//     try {
//       Map<String, dynamic> param = {
//         "MobileNo": phone,
//         "countryCode": countryCode,
//         "otp": otp,
//       };
//       var result = await ref.read(authServiceProvider).verifyOtp(param: param);
//
//       if (result.status == true) {
//         Utils.flutterToast(result.message.toString());
//         CreateProfileBottomSheet.show(
//           ContextUtility.navigatorkey.currentState!.context,
//         );
//         appRouter.router.goNamed(RouteConstants.homeScreen);
//       } else {
//         Utils.flutterToast(result.message.toString());
//         state = const AsyncData(null);
//       }
//     } catch (e) {
//       Utils.flutterToast(e.toString());
//       state = const AsyncData(null);
//     }
//   }
// }
