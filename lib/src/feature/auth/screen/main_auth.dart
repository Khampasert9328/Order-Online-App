import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:order_online_app/src/constants/set_color.dart';
import 'package:order_online_app/src/feature/auth/screen/login.dart';
import 'package:order_online_app/src/feature/auth/screen/register.dart';

class MainPageAuth extends StatefulWidget {
  const MainPageAuth({super.key});

  @override
  State<MainPageAuth> createState() => _MainPageAuthState();
}

class _MainPageAuthState extends State<MainPageAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network('https://lottie.host/a617949e-fb43-4b4a-a961-e4a10d4f56c5/8j9r6I2Eot.json'),
          SizedBox(
            height: 30.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginPage(),
                ),
              );
            },
            child: Container(
              height: 60.h,
              width: 300.w,
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.appRed,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                "ເຂົ້າສູ່ລະບົບ",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColor.appWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RegisterPage(),
                ),
              );
            },
            child: Container(
              height: 60.h,
              width: 300.w,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 20, left: 20),
              decoration: BoxDecoration(
                  color: AppColor.appWhite,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColor.appRed)),
              child: Text(
                "ລົງທະບຽນ",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
