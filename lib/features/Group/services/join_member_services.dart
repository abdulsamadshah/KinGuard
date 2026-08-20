import 'package:kinguard/core/constants/urls.dart';
import 'package:kinguard/core/network/http_util.dart';
import 'package:kinguard/data/models/all_users_model.dart';
import 'package:kinguard/data/models/member_res.dart';
import 'package:kinguard/data/models/user_groups_model.dart';

class JoinMemberServices {
  static Future<AllUsersRes> getAllUsers() async {
    final result = await HttpUtil().get(Urls.getAllUsers);
    return AllUsersRes.fromJson(result);
  }

  static Future<UserGroupsRes> getUserGroups() async {
    final result = await HttpUtil().get(Urls.getUserGroups);
    return UserGroupsRes.fromJson(result);
  }

  static Future<GetMembersRes> getMembers(int groupId) async {
    final result = await HttpUtil().get('${Urls.getMembers}/$groupId');
    return GetMembersRes.fromJson(result);
  }

  static Future<AddMemberRes> addMember({
    required int groupId,
    required int userId,
    String role = 'Member',
  }) async {
    final result = await HttpUtil().post(
      '${Urls.addMember}?GroupId=$groupId&UserId=$userId&Role=$role',
    );
    return AddMemberRes.fromJson(result);
  }
}