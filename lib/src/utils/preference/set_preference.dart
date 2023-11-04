import 'package:shared_preferences/shared_preferences.dart';

class SetPreference {
  String token = 'token';

  //set Token and getToken
  Future<void> setToken(String val) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    await pre.setString(token, val);
  }

  Future<String?> getToken() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    return pre.getString(token);
  }

  Future<void> clearToken() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    await pre.clear();
  }
}
