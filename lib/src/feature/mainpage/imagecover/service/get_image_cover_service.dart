import 'package:order_online_app/src/constants/app_api.dart';
import 'package:order_online_app/src/feature/mainpage/imagecover/models/image_cover.dart';
import 'package:order_online_app/src/utils/preference/set_preference.dart';
import 'package:http/http.dart' as http;

class ImagesCover {
  Future<ImageCoverModels?> getImageCover(context) async {
    try {
      String? token = await SetPreference().getToken();
      String url = APIService.getimageCover;
      final res = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          "Authorization": 'Bearer $token',
        },
      );
      if (res.statusCode == 200) {
        return imageCoverModelsFromJson(res.body);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
