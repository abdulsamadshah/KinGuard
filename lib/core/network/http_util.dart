import 'package:dio/dio.dart';
import 'package:kinguard/core/constants/pref_res.dart';
import 'package:kinguard/core/network/ApiErrorHandler.dart';

import 'package:kinguard/core/network/Constant.dart';
import 'package:kinguard/core/utils/Global.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }
  ConstRes api = ConstRes();

  HttpUtil._internal() {
    api.sendRequest.interceptors.add(PrettyDioLogger());
  }

  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    FormData? formdata,
    String? type,
  }) async {
    try {
      var response = await api.sendRequest.post(
        path,
        data: type == "formdata" ? formdata : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      if (e is DioException) {
        throw ApiErrorHandler.handleDioError(e);
      }
      throw "Something went wrong";
    }
  }

  Future<dynamic> authPost(String path,
      {dynamic data,
        Map<String, dynamic>? queryParameteres,
        FormData? formdata,
        ProgressCallback? onSendProgress,
        String? type}) async {
    try {
      api.sendRequest.options.headers["authorization"] =
      "Bearer ${Global.storageServices.getTokenValue()!}";
      api.sendRequest.options.headers['accept'] = 'application/json';
      var response = await api.sendRequest.post(path,
          data: type == "formdata" ? formdata : data,
          onSendProgress: onSendProgress,
          queryParameters: queryParameteres);
      return response.data;
    } catch (e) {
      if (e is DioException) {
        throw ApiErrorHandler.handleDioError(e);
      }
      throw "Something went wrong";
    }
  }


  Future<dynamic> userlocationpost(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameteres,
    FormData? formdata,
    String? type,
  }) async {
    try {
      var pref = await SharedPreferences.getInstance();
      var token = pref.getString(PrefConst.STORAGE_USER_TOKEN_KEY);
      var response = await api.sendRequest.post(
        path,
        data: type == "formdata" ? formdata : data,
        queryParameters: queryParameteres,
      );

      api.sendRequest.options.headers["authorization"] = 'Bearer $token';
      api.sendRequest.options.headers['accept'] = 'application/json';
      api.sendRequest.options.headers['content-type'] = 'application/json';
      return response.data;
    } catch (e) {
      if (e is DioException) {
        throw ApiErrorHandler.handleDioError(e);
      }
      throw "Something went wrong";
    }
  }

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? data,
    String? LogOuttype,
  }) async {
    try {
      api.sendRequest.options.headers["authorization"] =
          "Bearer ${Global.storageServices.getTokenValue()}";
      api.sendRequest.options.headers['accept'] = 'application/json';
      api.sendRequest.options.headers['content-type'] = 'application/json';
      var response = await api.sendRequest.get(path, queryParameters: data);
      return response.data;
    } catch (e) {
      if (e is DioException) {
        throw ApiErrorHandler.handleDioError(e);
      }
      throw "Something went wrong";
    }
  }
}
