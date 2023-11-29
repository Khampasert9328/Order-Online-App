import 'package:flutter/material.dart';
import 'package:order_online_app/src/feature/buyproducts/models/category/category_models.dart';
import 'package:order_online_app/src/feature/buyproducts/service/get_category_service.dart';
import 'package:order_online_app/src/feature/mainpage/imagecover/models/image_cover.dart';
import 'package:order_online_app/src/feature/mainpage/imagecover/service/get_image_cover_service.dart';
import 'package:order_online_app/src/feature/profile/models/profile_models.dart';
import 'package:order_online_app/src/feature/profile/service/get_profile.dart';

class ProviderService extends ChangeNotifier {
  bool _isload = false;
  bool get isloading => _isload;
  ImageCoverModels? _imgCover;
  ImageCoverModels? get imgCover => _imgCover;
  ProfileModels? _profile;
  ProfileModels? get profile => _profile;

  GetCategoryModels? _categoryModels;
  GetCategoryModels? get category => _categoryModels;

  Future<void> getImgCoverPro(context) async {
    if (_imgCover == null) {
      _isload = true;
      _imgCover = await ImagesCover().getImageCover(context);
      _isload = false;
    }

    notifyListeners();
  }

  Future<void> getProfilePro() async {
    if (_profile == null) {
      _isload = true;
      _profile = await ProfileService().getProfile();
      _isload = false;
    }
    notifyListeners();
  }

  Future<void> getCategoryPro() async {
    if (_categoryModels == null) {
      _isload = true;
      _categoryModels = await CategoryService().getCategory();
      _isload = false;
      notifyListeners();
    }
  }
}
