import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:order_online_app/src/constants/image_path.dart';
import 'package:order_online_app/src/constants/set_color.dart';
import 'package:order_online_app/src/feature/mainpage/home/home_page.dart';
import 'package:order_online_app/src/feature/provider/provicer_service.dart';
import 'package:provider/provider.dart';

class MenuBody extends StatefulWidget {
  const MenuBody({super.key});

  @override
  State<MenuBody> createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  int selectedIndex = 0;
  CarouselController controller = CarouselController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProviderService>().getImgCoverPro(context);
    });

    super.initState();
  }

  void handlePageChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderService>(builder: (context, model, children) {
      if (model.imgCover == null) {
        return Center(
            child: Lottie.asset(
          AppImage.loadingpage,
          height: 100.h,
          width: 100.w,
        ));
      }
      Future.delayed(Duration.zero, () {
        controller.jumpToPage(selectedIndex);
      });
      return Column(
        children: [
          CarouselSlider(
            items: model.imgCover?.data
                .map(
                  (e) => Image.memory(
                    base64Decode(e.coverImage.split(',')[1]),
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                )
                .toList(),
            carouselController: controller,
            options: CarouselOptions(
                height: 150.h,
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: handlePageChanged),
          ),
          SizedBox(
            height: 20.h,
          ),
          GridView.count(
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
          ),
        ],
      );
    });
  }
}
