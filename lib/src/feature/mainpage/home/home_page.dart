// ignore_for_file: prefer_const_constructors, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_online_app/src/constants/set_color.dart';
import 'package:order_online_app/src/feature/buyproducts/screen/buy_products.dart';
import 'package:order_online_app/src/feature/mainpage/main_page.dart';
import 'package:order_online_app/src/feature/orders/screen/main_order.dart';
import 'package:order_online_app/src/feature/profile/screen/profile.dart';

class HomePage extends StatefulWidget {
  int selecindex;
  HomePage({super.key, required this.selecindex});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> screen = [
    MainPage(),
    BuyProducts(),
    Profile(),
  ];
  final appbarName = [
    'ໜ້າຫຼັກ',
    'ສັ່ງຊື້ເຄື່ອງ',
    'ໂປຣໄຟຣ໌',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(appbarName[widget.selecindex]),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>MainOrder()));
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: screen[widget.selecindex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.red[100],
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child: NavigationBar(
          backgroundColor: AppColor.appWhite,
          selectedIndex: widget.selecindex,
          onDestinationSelected: (value) {
            setState(() {
              widget.selecindex = value;
            });
          },
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
                size: 25.sp,
              ),
              label: 'ໜ້າຫຼັກ',
              selectedIcon: Icon(
                Icons.home_outlined,
                size: 25.sp,
              ),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.shop_2_outlined,
                size: 25.sp,
              ),
              label: 'ສັ່ງເຄື່ອງ',
              selectedIcon: Icon(
                Icons.shop_2_outlined,
                size: 25.sp,
              ),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.people_outline_outlined,
                size: 25.sp,
              ),
              label: 'ໂປຣໄຟຮ໌',
              selectedIcon: Icon(
                Icons.people_outline_outlined,
                size: 25.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
