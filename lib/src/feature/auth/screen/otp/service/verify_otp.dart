import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:order_online_app/src/constants/app_api.dart';
import 'package:order_online_app/src/feature/auth/provider/set_provider_address.dart';
import 'package:order_online_app/src/feature/auth/screen/login.dart';
import 'package:order_online_app/src/widget/loading/dialog_success.dart';
import 'package:provider/provider.dart';

class VerifyOTP {
  Future verifyOTP(String? otp, context) async {
    final registerid = Provider.of<AddressProvider>(context, listen: false).registerid;
    try {
      final res = await http.post(
        Uri.parse(APIService.verifyotp),
        body: jsonEncode({
          "register_id": registerid,
          "otp": otp,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print("verify===${res.body}");
      print("verifyStatus===${res.statusCode}");
      if (res.statusCode == 200) {
        showDialog(
          context: context,
          builder: (_) => LoadingSuccess(
            title: "ຢືນຢັນລະຫັດ OTP ສຳເລັດແລ້ວ\n ກາລຸນາເຂົ້າສູ່ລະບົບ",
            ok: 'ຕົກລົງ',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginPage(),
                ),
              );
            },
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
