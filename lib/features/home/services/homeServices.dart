import 'package:kinguard/core/constants/urls.dart';
import 'package:kinguard/core/network/http_util.dart';
import 'package:kinguard/data/models/GroupModel.dart';

class HomeServices {
  static Future<GroupRes> getUserGroups() async {
    final result = await HttpUtil().get(Urls.getUserGroups);
    return GroupRes.fromJson(result);
  }
}