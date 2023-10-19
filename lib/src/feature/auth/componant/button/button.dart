// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_online_app/src/constants/set_color.dart';

class BottomWidget extends StatefulWidget {
  String title;
  VoidCallback onTap;
  BottomWidget({super.key, required this.onTap, required this.title});

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 60.h,
        width: 370.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.appRed,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 18.sp,
            color: AppColor.appWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
