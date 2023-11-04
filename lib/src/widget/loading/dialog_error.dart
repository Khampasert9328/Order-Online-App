import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:order_online_app/src/constants/image_path.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String titleBtn;
  final VoidCallback onPress;
  final Color color;

  const AlertDialogWidget(
      {Key? key,
      required this.title,
      required this.titleBtn,
      required this.onPress,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(shrinkWrap: true, children: [
          Column(
            children: [
              Lottie.network(
              AppImage.loadingerror,
              height: 120.h,
            ),
              const SizedBox(
                height: 10,
              ),
              // Some text
              Align(
                alignment: Alignment.center,
                child: Text(title, style: const TextStyle(fontSize: 16)),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: color,
                  ),
                  onPressed: onPress,
                  child: Text(
                    titleBtn,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ]),
      ),
    );
  }
}
