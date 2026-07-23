import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinguard/core/constants/urls.dart';
import 'package:kinguard/core/network/http_util.dart';
import 'package:kinguard/data/models/CommonRes.dart';
import 'package:kinguard/data/models/otp-verify.dart';

class AuthService {
  Future<CommonResponse> sendOtp({required String phone}) async {
    var param = {"MobileNo": phone, "countryCode": "+91"};
    var response = await HttpUtil().post(Urls.login, data: param);
    return CommonResponse.fromJson(response);
  }

  Future<VerifyOtpResponse> verifyOtp({required dynamic param}) async {
    var response = await HttpUtil().post(Urls.verifyOtp, data: param);
    return VerifyOtpResponse.fromJson(response);
  }

   Future<CommonResponse> register({required FormData data}) async {
    var response = await HttpUtil().authPost(
      Urls.updateProfile,
      formdata: data,
      type: "formdata",
    );
    return CommonResponse.fromJson(response);
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});
