import 'package:flutter/material.dart';
import 'package:order_online_app/src/constants/set_color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.appWhite,
        title: Text(
          "ລົງທະບຽນ",
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
