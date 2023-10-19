import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:order_online_app/src/constants/app_api.dart';
import 'package:http/http.dart' as http;
import 'package:order_online_app/src/constants/set_color.dart';
import 'package:order_online_app/src/feature/auth/models/login/login_models.dart';
import 'package:order_online_app/src/feature/mainpage/home/home_page.dart';
import 'package:order_online_app/src/utils/preference/set_preference.dart';
import 'package:order_online_app/src/widget/loading/dialog_error.dart';
import 'package:order_online_app/src/widget/loading/loading_login.dart';

class AuthService {
  Future login(String? email, String? password, context) async {
    LoadingLogin(title: "ກຳລັງເຂົ້າສູ່ລະບົບ...");
    try {
      String url = APIService.login;
      Object body = jsonEncode({
        "email": email,
        "pass": password,
      });
      final res = await http.post(
        Uri.parse(url),
        body: body,
      );

      if (res.statusCode == 200) {
        Navigator.pop(context);
        var map = Map<String, dynamic>.from(jsonDecode(res.body));
        LoginModels models = LoginModels.fromJson(map);
        SetPreference().setToken(models.token);
        return Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) => const HomePage(),
            ),
            (route) => false);
      } else {
        Navigator.pop(context);
        return AlertDialogWidget(
          title: 'ລອງໃໝ່ອິກຄັ້ງ',
          icons: 'https://lottie.host/25c89ef5-db8b-408f-bb81-bc984123a0d1/l2KEEGOjq7.json',
          titleBtn: 'ຕົກລົງ',
          onPress: () {
            Navigator.pop(context);
          },
          color: AppColor.appRed,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register() async {
    try {} catch (e) {
      return;
    }
  }
}
