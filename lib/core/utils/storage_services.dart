import 'package:kinguard/core/network/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  late final SharedPreferences _prefs;

  Future<StorageServices> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    return _prefs.getBool(key) ?? false;
  }

  Future<bool> setDefaultTheme(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> getDefaultTheme() async {
    return _prefs.getBool(Constant.isDarkMode) ?? false;
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  bool getIsLoggedIn() {
    return _prefs.getString(Constant.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  String? getTokenValue() {
    return _prefs.getString(Constant.STORAGE_USER_TOKEN_KEY);
  }

  String? Location_Permission_Check() {
    return _prefs.getString(Constant.Location_Permission);
  }

  String? getDevice_id() {
    return _prefs.getString(Constant.DEVICE_ID);
  }


  String? get(String key) {
    return _prefs.getString(key);
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }
}
