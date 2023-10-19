import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:order_online_app/src/constants/image_path.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AppImage.loading, width: 150.w, height: 150.h, frameRate: FrameRate(60),
        // Set your desired color here
      ),
    );
  }
}
