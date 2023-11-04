import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:order_online_app/src/constants/app_api.dart';
import 'package:order_online_app/src/feature/profile/models/profile_models.dart';
import 'package:order_online_app/src/utils/preference/set_preference.dart';

import 'package:http/http.dart' as http;

class ProfileService {
  Future<ProfileModels?> getProfile() async {
    try {
      String? token = await SetPreference().getToken();
      Map<String, dynamic> decodeToken = JwtDecoder.decode(token!);
      int id = decodeToken['uid'];
      String url = '${APIService.getprofile}/$id';
      final res = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application',
          'Authorization': 'Bearer $token',
        },
      );
      if (res.statusCode == 200) {
        return profileModelsFromJson(res.body);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
