// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:order_online_app/src/constants/image_path.dart';

class LoadingPage extends StatefulWidget {
  String title;
  LoadingPage({Key? key, required this.title}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with TickerProviderStateMixin {
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
            Lottie.asset(
              AppImage.loadingpage,
              height: 100.h,
            ),
            // const SizedBox(
            //   height: 40,
            // ),
            // Some text
            Text(widget.title),
          ],
        ),
      ),
    );
  }
}
