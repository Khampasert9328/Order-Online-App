import 'package:flutter/material.dart';

class AddressProvider extends ChangeNotifier {
  String? _province, _city, _village;
  String? get province => _province;
  String? get city => _city;
  String? get village => _village;



  set proName(String? val) {
    _province = val;
    notifyListeners();
  }

  set disName(String? val) {
    _city = val;
    notifyListeners();
  }

  set villName(String? val) {
    _village = val;
    notifyListeners();
  }


   /// Province that user live in
  setProvince(String? province) {
    _province = province;
    notifyListeners();
  }

  /// District that user live in
  setCity(String? city) {
    _city = city;
    notifyListeners();
  }

  /// Village that user live in
  setVillage(String? village) {
    _village = village;
    notifyListeners();
  }
}