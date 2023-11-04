import 'package:flutter/material.dart';
import 'package:order_online_app/src/feature/auth/screen/main_auth.dart';
import 'package:order_online_app/src/feature/mainpage/home/home_page.dart';
import 'package:order_online_app/src/utils/preference/set_preference.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  void navigator(Widget child) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => child));
  }

  void checkLogin() async {
    String? token = await SetPreference().getToken();
    if (token != null) {
      navigator( HomePage(selecindex: 0,));
    } else {
      navigator(const MainPageAuth());
    }
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
