import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionProvider extends ChangeNotifier {
  String _version = "";
  String get version => _version;

  void getVersion() async {
    PackageInfo info = await PackageInfo.fromPlatform();
    _version = info.version;
    notifyListeners();
  }
}
