// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:order_online_app/src/constants/image_path.dart';
import 'package:order_online_app/src/constants/set_color.dart';

class LoadingSuccess extends StatefulWidget {
  String title;
  String ok;
  VoidCallback onTap;
  LoadingSuccess({Key? key, required this.title, required this.ok, required this.onTap}) : super(key: key);

  @override
  State<LoadingSuccess> createState() => _LoadingSuccessState();
}

class _LoadingSuccessState extends State<LoadingSuccess> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.network(
              AppImage.loadingsuccess,
              height: 100.h,
            ),
            // const SizedBox(
            //   height: 40,
            // ),
            // Some text
            Text(widget.title),
            SizedBox(
              height: 15.h,
            ),
            GestureDetector(
              onTap: widget.onTap,
              child: Container(
                height: 50.h,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColor.appRed,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  widget.ok,
                  style: TextStyle(color: AppColor.appWhite),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
