import 'package:dio/dio.dart';
import 'package:kinguard/core/constants/urls.dart';
import 'package:kinguard/core/network/http_util.dart';

class CreateGroupServices {
  static Future<Map<String, dynamic>> createGroup({
    required String groupName,
    required String groupType,
    String? imagePath,
  }) async {
    final formData = FormData.fromMap({
      'GroupName': groupName,
      'GroupType': groupType,
      if (imagePath != null && imagePath.isNotEmpty)
        'GroupImage': await MultipartFile.fromFile(
          imagePath,
          filename: imagePath.split('/').last,
        ),
    });

    final result = await HttpUtil().post(Urls.createGroup, data: formData);

    return result;
  }
}
