import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_online_app/src/feature/mainpage/home/component/carousel.dart';
import 'package:order_online_app/src/feature/mainpage/home/component/menu_body.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CarouselWidget(),
          SizedBox(
            height: 20.h,
          ),
          const MenuBody()
        ],
      ),
    );
  }
}
