// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_online_app/src/feature/auth/component/button/button.dart';
import 'package:order_online_app/src/feature/auth/screen/otp/service/verify_otp.dart';
import 'package:pinput/pinput.dart';

class OTPForm extends StatefulWidget {
  OTPForm({Key? key}) : super(key: key);

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  String? otp = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Pinput(
          onChanged: (value) {
            otp = value;
          },
          length: 6,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: BottomWidget(
            title: 'ຢືນຢັນໂອທີພີ',
            onTap: () {
              VerifyOTP().verifyOTP(otp, context);
            },
          ),
        )
      ],
    );
  }
}
