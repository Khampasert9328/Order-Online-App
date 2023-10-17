import 'package:flutter/material.dart';
import 'package:order_online_app/src/constants/set_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.appWhite,
        title: Text(
          "ເຂົ້າສູ່ລະບົບ",
          style: TextStyle(
            color: AppColor.appBlack,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.appBlack,
          ),
        ),
      ),
    );
  }
}
