import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:order_online_app/src/feature/buyproducts/models/product_models.dart';
import 'package:order_online_app/src/feature/buyproducts/models/vm_category_models.dart';
import 'package:order_online_app/src/feature/buyproducts/screen/detail/detail_products.dart';
import 'package:order_online_app/src/feature/provider/provicer_service.dart';
import 'package:order_online_app/src/utils/setData.dart';
import 'package:order_online_app/src/widget/loading/loading_page.dart';
import 'package:provider/provider.dart';

class BuyProducts extends StatefulWidget {
  const BuyProducts({super.key});

  @override
  State<BuyProducts> createState() => _BuyProductsState();
}

class _BuyProductsState extends State<BuyProducts> {
  List<CategoryModels> listCategory = [
    CategoryModels(
      id: 1,
      name: 'ທັງໝົດ',
    ),
    CategoryModels(
      id: 2,
      name: 'ເຄື່ອງສຳອາງ',
    ),
    CategoryModels(
      id: 3,
      name: 'ຄອມພິວເຕີ',
    ),
    CategoryModels(
      id: 4,
      name: 'ຄອມພິວເຕີ',
    ),
    CategoryModels(
      id: 5,
      name: 'ຄອມພິວເຕີ',
    )
  ];

  List<ProductsModels> listProducts = [
    ProductsModels(
      id: 1,
      name: "Acer",
      price: 5000000,
      image: 'assets/images/acer.webp',
    ),
    ProductsModels(
      id: 2,
      name: "PHP",
      price: 7000000,
      image: 'assets/images/php.jpg',
    ),
    ProductsModels(
      id: 3,
      name: "Acer",
      price: 5000000,
      image: 'assets/images/acer.webp',
    ),
    ProductsModels(
      id: 4,
      name: "Lenovo",
      price: 5000000,
      image: 'assets/images/lenovo.jpg',
    ),
    ProductsModels(
      id: 5,
      name: "DEL",
      price: 5000000,
      image: 'assets/images/del.jpg',
    ),
    ProductsModels(
      id: 6,
      name: "Acer",
      price: 5000000,
      image: 'assets/images/acer.webp',
    )
  ];

  @override
  void initState() {
    context.read<ProviderService>().getCategoryPro();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final setData = Provider.of<SetDataProvider>(context, listen: false);
    return Consumer<ProviderService>(builder: (context, value, children) {
      if (value.isloading == true) {
        return LoadingPage(title: "ກຳລັງໂຫຼດຂໍ້ມູນ...");
      } else if (value.category == null || value.category!.data!.isEmpty) {
        return const Center(
          child: Text("ບໍ່ມີຂໍ້ມູນ"),
        );
      }
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CupertinoSearchTextField(
              placeholder: 'ຄົ້ນຫາສິນຄ້າ',
              onChanged: (value) {},
            ),
            SizedBox(
              height: 10.h,
            ),
            const Text(
              "ໝວດໝູ່",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50.h,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    height: 35.h,
                    width: 70.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: const Text(
                      "ທັງໝົດ",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: value.category?.data?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final data = value.category?.data?[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: GestureDetector(
                              onTap: () {
                                //set id category for api
                                setData.setIdCategory(data?.typeId);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 5),
                                height: 35.h,
                                width: 70.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Text(
                                  data?.typeName ?? "",
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            const Text(
              "ສິນຄ້າ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                ),
                itemCount: listProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  String formatPrice = NumberFormat.decimalPattern()
                      .format(listProducts[index].price);
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DetailProducts(
                                          data: listProducts[index],
                                        )));
                          },
                          child: Image.asset(
                            listProducts[index].image!,
                            fit: BoxFit.cover,
                            height: 100.h,
                            width: 300.w,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("ຊື່:"),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(listProducts[index].name!),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("ລາຄາ:"),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(formatPrice),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(Icons.shopping_cart_outlined)
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
