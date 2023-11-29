import 'package:flutter/material.dart';

class SetDataProvider extends ChangeNotifier {
  int? _idCategory;
  int? get idCategory => _idCategory;

  Future<void> setIdCategory(int? value) async {
    _idCategory = value;
    notifyListeners();
  }
}
