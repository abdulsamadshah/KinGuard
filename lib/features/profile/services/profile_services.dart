import 'package:kinguard/core/constants/urls.dart';
import 'package:kinguard/core/network/http_util.dart';
import 'package:kinguard/data/models/CommonRes.dart';
import 'package:kinguard/data/models/user-profile.dart';

class ProfileServices {
  static Future<UserProfile> getUserProfileData() async {
    var result = await HttpUtil().get(Urls.profile);
    return UserProfile.fromJson(result);
  }

  static Future<CommonResponse> logOut() async {
    var result = await HttpUtil().get(Urls.logOut);
    return CommonResponse.fromJson(result);
  }

}
