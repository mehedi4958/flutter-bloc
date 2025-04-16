import 'package:flutter_block/common/values/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _prefs;
  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool getDeviceOpenedFirst() {
    return _prefs.getBool(AppConstants.storeDeviceOpenedFirst) ?? false;
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  bool getIsLoggedIn() {
    return _prefs.getString(AppConstants.storeUserTokenKey) == null
        ? false
        : true;
  }
}
