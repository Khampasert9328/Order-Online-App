// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_online_app/src/feature/buyproducts/models/product_models.dart';

class DetailProducts extends StatefulWidget {
  ProductsModels? data;
  DetailProducts({super.key, required this.data});

  @override
  State<DetailProducts> createState() => _DetailProductsState();
}

class _DetailProductsState extends State<DetailProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ລາຍລະອຽດສິນຄ້າ"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Image.asset(
              widget.data!.image.toString(),
              height: 200.h,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [Text("ຊື່: "), Text(widget.data!.name.toString())],
                  ),
                  Row(
                    children: [
                      Text("ລາຄາ: "),
                      Text(widget.data!.price.toString())
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 80.h,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 5.h,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopping_cart_checkout_sharp,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "ເພີ່ມ",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
