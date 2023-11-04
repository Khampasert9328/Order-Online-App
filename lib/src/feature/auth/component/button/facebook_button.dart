import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_online_app/src/constants/set_color.dart';

class FaceBookButton extends StatefulWidget {
  const FaceBookButton({super.key});

  @override
  State<FaceBookButton> createState() => _FaceBookButtonState();
}

class _FaceBookButtonState extends State<FaceBookButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColor.appWhite,
            borderRadius: BorderRadius.circular(100.r),
            border: Border.all(color: AppColor.appRed)),
        child: IconButton(
          icon: Icon(
            FontAwesomeIcons.facebook,
            color: AppColor.appRed,
          ),
          onPressed: () {},
        ));
  }
}
