import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_online_app/src/constants/set_color.dart';

class GoogleButton extends StatefulWidget {
  const GoogleButton({super.key});

  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 20, left: 20),
        decoration: BoxDecoration(
            color: AppColor.appWhite,
            borderRadius: BorderRadius.circular(100.r),
            border: Border.all(color: AppColor.appRed)),
        child: IconButton(
          icon: Icon(
            FontAwesomeIcons.google,
            color: AppColor.appRed,
          ),
          onPressed: () {},
        ));
  }
}
