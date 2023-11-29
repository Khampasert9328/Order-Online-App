import 'package:order_online_app/src/constants/app_api.dart';
import 'package:order_online_app/src/feature/buyproducts/models/category/category_models.dart';
import 'package:order_online_app/src/utils/preference/set_preference.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<GetCategoryModels?> getCategory() async {
    String? token = await SetPreference().getToken();

    String url = APIService.getCategory;
    final res = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": 'Bearer $token',
    });
    if (res.statusCode == 200) {
      return getCategoryModelsFromJson(res.body);
    }
    return null;
  }
}
