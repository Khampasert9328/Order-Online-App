import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_online_app/src/constants/set_color.dart';
import 'package:order_online_app/src/feature/provider/provicer_service.dart';
import 'package:provider/provider.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
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
    return Consumer<ProviderService>(builder: (ctn, model, child) {
      if (model.imgCover == null) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColor.appRed,
          ),
        );
      }

      // Use Future.delayed to run code after the build is complete
      Future.delayed(Duration.zero, () {
        // Your code that needs to be executed after the build
        // For example, you can call your controller here
        controller.jumpToPage(selectedIndex);
      });

      return Stack(
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
        ],
      );
    });
  }
}
