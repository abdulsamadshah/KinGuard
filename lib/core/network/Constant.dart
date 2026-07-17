import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const Color primaryColor = Color(0xFF7B61FF);
const double defaultPadding = 16.0;
var ProductionUrl = "https://production.fgmanpower.co.in";
String TestingUrl = "https://admin.fgmanpower.co.in";

class Constant {
  static String env = "dev";
  static String Baseurl = "$TestingUrl/api/";
  //  static String imageBaseUrl = TestingUrl;
  static String StartJobDeepLink_Url = "https://partner.fgmanpower.co.in";
  static String appGuide = "https://youtu.be/TnKDRwKU3fw?si=2LJtscy1-Apjks2i";
  static BaseOptions networkOptions = BaseOptions(
    receiveTimeout: const Duration(seconds: 15),
    connectTimeout: const Duration(seconds: 15),
    baseUrl: Baseurl,
  );

  final Dio _dio = Dio();
  Constant() {
    BaseOptions options = BaseOptions(baseUrl: Baseurl);
    _dio.options = options;
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio;
  static String CurrentVersion = "";
  static String STORAGE_USER_TOKEN_KEY = "token";
  static String DEVICE_ID = "device_id";
  static String Location_Permission = "Location_Permission";
  static String isDarkMode = "isDarkMode";
}
