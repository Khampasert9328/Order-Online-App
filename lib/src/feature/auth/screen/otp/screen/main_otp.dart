import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:order_online_app/src/constants/set_color.dart';
import 'package:order_online_app/src/feature/auth/screen/otp/component/body_otp.dart';

class MainOTP extends StatefulWidget {
  const MainOTP({super.key});

  @override
  State<MainOTP> createState() => _MainOTPState();
}

class _MainOTPState extends State<MainOTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.appWhite,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Verification Code"),
            Lottie.network(
              'https://lottie.host/6e749bee-a1a2-4b76-bc56-881eaa9c9366/hrNXItchGM.json',
              height: 200.h,
              width: 300.w,
            ),
            Center(
              child: OTPForm(),
            ),
          ],
        ),
      ),
    );
  }
}
