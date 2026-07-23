import 'package:kinguard/core/constants/pref_res.dart';
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


  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }


  String? getTokenValue() {
    return _prefs.getString(PrefConst.STORAGE_USER_TOKEN_KEY);
  }


  String? get(String key) {
    return _prefs.getString(key);
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }
}
