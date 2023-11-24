// ignore_for_file: unnecessary_string_interpolations

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:order_online_app/src/constants/app_api.dart';
import 'package:http/http.dart' as http;
import 'package:order_online_app/src/constants/set_color.dart';
import 'package:order_online_app/src/feature/auth/models/login/login_models.dart';
import 'package:order_online_app/src/feature/auth/models/register/register_models.dart';
import 'package:order_online_app/src/feature/auth/provider/set_provider_address.dart';
import 'package:order_online_app/src/feature/auth/screen/otp/screen/main_otp.dart';
import 'package:order_online_app/src/feature/mainpage/home/home_page.dart';
import 'package:order_online_app/src/utils/preference/set_preference.dart';
import 'package:order_online_app/src/widget/loading/dialog_error.dart';
import 'package:order_online_app/src/widget/loading/dialog_success.dart';
import 'package:order_online_app/src/widget/loading/loading_login.dart';
import 'package:provider/provider.dart';

class AuthService {
  Future<void> login(String? email, String? password, context) async {
    showDialog(
      context: context,
      builder: (_) => LoadingLogin(title: "ກຳລັງເຂົ້າສູ່ລະບົບ..."),
    );

    try {
      final res = await http.post(
        Uri.parse(APIService.login),
        body: jsonEncode({
          "email": email,
          "pass": password,
        }),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );

      if (res.statusCode == 200) {
        Navigator.pop(context);
        var map = Map<String, dynamic>.from(jsonDecode(res.body));
        LoginModels models = LoginModels.fromJson(map);
        SetPreference().setToken(models.token);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) => HomePage(
                selecindex: 0,
              ),
            ),
            (route) => false);
      } else {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (_) => AlertDialogWidget(
            title: "ກາລຸນາລອງໃໝ່ອີກຄັ້ງ",
            titleBtn: 'ຕົກລົງ',
            onPress: () {
              Navigator.pop(context);
            },
            color: AppColor.appRed,
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register(context, String? name, String? email, String? phone, String? password, String? basefile,
      String? prooftype) async {
    showDialog(
      context: context,
      builder: (_) => LoadingLogin(title: "ກຳລັງບັນທຶກຂໍ້ມູນ..."),
    );
    final address = Provider.of<AddressProvider>(context, listen: false);
    String? replace1 = address.province!.replaceAll("(", "");
    String? province = replace1.replaceAll(")", "");
    String? replace2 = address.city!.replaceAll("(", "");
    String? district = replace2.replaceAll(")", "");
    String? replace3 = address.village!.replaceAll("(", "");
    String? village = replace3.replaceAll(")", "");
    int registertype = 1;

    try {
      Object body = jsonEncode({
        "fullname": name,
        "email": email,
        "phone": phone,
        "pass": password,
        "registerType": registertype,
        "provCode": province,
        "distID": district,
        "villageID": village,
        "proofType": prooftype,
        "proofImage": basefile ?? "ລູກຄ້າທົ່ວໄປ"
      });
      final res = await http.post(
        Uri.parse(APIService.register),
        body: body,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      print(res.statusCode);
      print("status==${res.body}");
      if (res.statusCode == 200) {
        var map = Map<String, dynamic>.from(jsonDecode(res.body));
        RegisterModels models = RegisterModels.fromJson(map);
        address.setRegisterid(models.registerId);
        print('registerid===${models.registerId}');
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (_) => LoadingSuccess(
            title: "ກາລຸນາກວດສອບ ອີເມລຂອງທ່ານເພື່ອເອົາລະຫັດ OTP ໄປຢືນຢັນໃນຂັ້ນຕອນຕໍ່ໄປ",
            ok: "ຕົກລົງ",
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) => const MainOTP(),
                  ),
                  (route) => false);
            },
          ),
        );
        
      } else {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (_) => AlertDialogWidget(
            title: "ກາລຸນາລອງໃໝ່ອີກຄັ້ງ",
            titleBtn: 'ຕົກລົງ',
            onPress: () {
              Navigator.pop(context);
            },
            color: AppColor.appRed,
          ),
        );
      }
    } catch (e) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (_) => AlertDialogWidget(
          title: "ແຈ້ງເຕືອນ \n$e ລອງໃໝ່ອີກຄັ້ງ",
          titleBtn: 'ຕົກລົງ',
          onPress: () {
            Navigator.pop(context);
          },
          color: AppColor.appRed,
        ),
      );
    }
  }
}
