import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_online_app/src/constants/set_color.dart';
import 'package:order_online_app/src/feature/mainpage/home/home_page.dart';

class MenuBody extends StatefulWidget {
  const MenuBody({super.key});

  @override
  State<MenuBody> createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomePage(selecindex: 1),
                  ),
                );
              },
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.appRed, width: 3),
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Icon(
                  Icons.shop_2_outlined,
                  color: AppColor.appRed,
                ),
              ),
            ),
            const Text("ສັ່ງເຄື່ອງ")
          ],
        ),
        Column(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.appRed, width: 3),
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Icon(
                Icons.history,
                color: AppColor.appRed,
              ),
            ),
            const Text("ປະຫວັດສັ່ງຊື້")
          ],
        ),
        Column(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.appRed, width: 3),
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Icon(
                Icons.headset_mic_outlined,
                color: AppColor.appRed,
              ),
            ),
            const Text("ຕິດຕໍ່ສອບຖາມ")
          ],
        ),
        Column(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.appRed, width: 3),
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Icon(
                Icons.info_outline,
                color: AppColor.appRed,
              ),
            ),
            const Text("ກ່ຽວກັບ NB")
          ],
        ),
        Column(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.appRed, width: 3),
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Icon(
                Icons.border_color_outlined,
                color: AppColor.appRed,
              ),
            ),
            const Text("ວິທີການນຳໃຊ້")
          ],
        )
      ],
    );
  }
}
