import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:order_online_app/src/constants/set_color.dart';
import 'package:order_online_app/src/feature/auth/component/button/button.dart';
import 'package:order_online_app/src/feature/auth/component/button/facebook_button.dart';
import 'package:order_online_app/src/feature/auth/component/button/google_button.dart';
import 'package:order_online_app/src/feature/auth/component/textfiled/text_filed.dart';
import 'package:order_online_app/src/feature/auth/models/customer/customers_models.dart';
import 'package:order_online_app/src/feature/auth/models/district/district_models.dart';
import 'package:order_online_app/src/feature/auth/models/province/province_models.dart';
import 'package:order_online_app/src/feature/auth/models/village/village_models.dart';
import 'package:order_online_app/src/feature/auth/provider/set_provider_address.dart';
import 'package:order_online_app/src/feature/auth/screen/login.dart';
import 'package:order_online_app/src/feature/auth/service/auth.dart';
import 'package:order_online_app/src/feature/auth/utils/set_image.dart';
import 'package:order_online_app/src/widget/dropdown/dropdown_widget.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool onOpenvil = false;
  CustomersModels? selectValue;
  int? selectindex;
  List<CustomersModels> customers = [
    CustomersModels(
      id: 1,
      name: 'ລູກຄ້າທົ່ວໄປ',
    ),
    CustomersModels(
      id: 2,
      name: 'ລູກຄ້າ COD',
    )
  ];
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController tell = TextEditingController();
  TextEditingController password = TextEditingController();
  String? province;
  String? district;
  String? village;

  final _form = GlobalKey<FormState>();

  //imagepicker
  XFile? image;
  String? base64String;
  pickImage(ImageSource source) {
    AppImagePicker(source: source).pick(onPick: (XFile? image) {
      setState(() {
        this.image = image;
        debugPrint(image!.path);
      });
      List<int> imageBytes = File(image!.path).readAsBytesSync();
      base64String = base64Encode(imageBytes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.appWhite,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.appWhite,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.appBlack,
            ),
          ),
        ),
        body: Consumer<AddressProvider>(builder: (ctn, models, ch) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _form,
                child: Column(
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ລົງທະບຽນ",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Text(
                            "ຊື່:",
                            style: TextStyle(
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFiledWidget(
                            validator: (value) {
                              if (value == null) {
                                return 'ກາລຸນາປ້ອນຊື່';
                              }
                              return null;
                            },
                            hide: false,
                            hintText: 'ປ້ອນຊື່',
                            controller: name,
                            icon: Icons.person_outline_outlined,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "ອີເມລ:",
                            style: TextStyle(
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFiledWidget(
                            validator: (value) {
                              if (value == null) {
                                return 'ກາລຸນາປ້ອນທີ່ຢູ່ອິເມລ';
                              }
                              return null;
                            },
                            hide: false,
                            hintText: 'ປ້ອນທີ່ຢູ່ອິເມລ',
                            controller: email,
                            icon: Icons.email_outlined,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "ເບີໂທ:",
                            style: TextStyle(
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFiledWidget(
                            validator: (value) {
                              if (value == null) {
                                return 'ກາລຸນາປ້ອນເບີໂທລະສັບຂອງທ່ານ';
                              }
                              return null;
                            },
                            hide: false,
                            hintText: 'ປ້ອນເບີໂທ',
                            controller: tell,
                            icon: Icons.phone_callback_outlined,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "ລະຫັດຜ່ານ:",
                            style: TextStyle(
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFiledWidget(
                            validator: (value) {
                              if (value == null) {
                                return 'ກາລຸນາປ້ອນລະຫັດຜ່ານຂອງທ່ານ';
                              }
                              return null;
                            },
                            hide: false,
                            hintText: 'ປ້ອນລະຫັດຜ່ານ',
                            controller: password,
                            icon: Icons.lock_outline,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "ແຂວງ:",
                            style: TextStyle(
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          DropDownWidget(
                            item: ProVinceModel.province.map((Map value) {
                              return DropdownMenuItem<String>(
                                value: value["_id"],
                                child: Text(value["pro_name"]),
                              );
                            }).toList(),
                            value: province,
                            onChange: (String? value) {
                              setState(() {
                                province = value!;
                                district = CityModel.city
                                    .where((element) => element["pro_id"] == province)
                                    .map((e) => e["_id"])
                                    .first;
                                village = Village.village
                                    .where((element) => element["dist_id"] == district)
                                    .map((e) => e["_id"])
                                    .first;

                                models.proName = ProVinceModel.province
                                    .where((element) => element["_id"] == province)
                                    .map((e) => e["pro_name"])
                                    .toString();

                                ///set district Id
                                models.disName = CityModel.city
                                    .where((element) => element["_id"] == district)
                                    .map((e) => e["dist_name"])
                                    .toString();

                                /// set village id
                                models.villName = Village.village
                                    .where((element) => element["_id"] == village)
                                    .map((e) => e["vill_name"])
                                    .toString();
                              });
                            },
                            hint: 'ເລືອກແຂວງ',
                            validator: (value) {
                              if (value == null || value == "") {
                                return 'ກະລຸນາເລືອກຂໍ້ມູນ';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "ເມືອງ:",
                            style: TextStyle(
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          DropDownWidget(
                            item: CityModel.city.where((element) => element["pro_id"] == province).map((Map value) {
                              return DropdownMenuItem<String>(value: value["_id"], child: Text(value["dist_name"]));
                            }).toList(),
                            value: district,
                            onChange: (String? value) {
                              setState(() {
                                district = value!;

                                ///set district name
                                models.disName = CityModel.city
                                    .where((element) => element["_id"] == district)
                                    .map((e) => e["dist_name"])
                                    .toString();

                                ///change village Id
                                village = Village.village
                                    .where((element) => element["dist_id"] == district)
                                    .map((e) => e["_id"])
                                    .first;

                                ///set village name
                                models.villName = Village.village
                                    .where((element) => element["_id"] == village)
                                    .map((e) => e["vill_name"])
                                    .toString();

                                ///set district Id
                                models.setCity(value);

                                /// set village id
                                models.setVillage(village ?? "");
                              });
                            },
                            hint: 'ເລືອກເມືອງ',
                            validator: (value) {
                              if (value == null || value == "") {
                                return 'ກະລຸນາເລືອກຂໍ້ມູນ';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "ບ້ານ:",
                            style: TextStyle(
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          DropDownWidget(
                            item: Village.village
                                .where((element) => element["dist_id"] == district)
                                .map<DropdownMenuItem<String>>((value) {
                              return DropdownMenuItem<String>(
                                value: value["_id"],
                                child: Text(value["vill_name"]),
                              );
                            }).toList(),
                            value: village,
                            onChange: (String? value) {
                              setState(() {
                                village = value!;
                                models.setVillage(value);
                                models.villName = Village.village
                                    .where((element) => element["_id"] == village)
                                    .firstWhere((e) => e["vill_name"])
                                    .toString();
                              });
                            },
                            hint: 'ເລືອກບ້ານ',
                            validator: (value) {
                              if (value == null || value == "") {
                                return 'ກະລຸນາເລືອກຂໍ້ມູນ';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "ປະເພດລູກຄ້າ:",
                            style: TextStyle(
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: DropdownButton<CustomersModels>(
                                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                                hint: const Text('ເລືອກປະເພດລູກຄ້າ'),
                                underline: const SizedBox(),
                                value: selectValue,
                                isExpanded: true,
                                items: customers
                                    .map<DropdownMenuItem<CustomersModels>>((e) => DropdownMenuItem(
                                          onTap: () {
                                            setState(() {
                                              selectindex = e.id;
                                            });
                                          },
                                          value: e,
                                          child: Text(
                                            (e.name ?? "").toString(),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectValue = value;
                                  });
                                }),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          selectindex == 2
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    image == null
                                        ? Container(
                                            alignment: Alignment.center,
                                            height: 150.h,
                                            width: 150.w,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.circular(10.r),
                                            ),
                                            child: const Text("ຮູບພາບ"))
                                        : Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.r),
                                              ),
                                            ),
                                            child: Image.file(
                                              height: 150.h,
                                              width: 150.w,
                                              File(image!.path),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                    Column(
                                      children: [
                                        const Text("ກາລຸນາແນບບັດປະຈຳຕົວ, ພາສປອດ \nຫຼື ສຳມະໂນຄົວ ເພື່ອຢືນຢັນຕົວຕົນ"),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Container(
                                          height: 37.h,
                                          width: 150.w,
                                          decoration: BoxDecoration(
                                              color: AppColor.appRed, borderRadius: BorderRadius.circular(10.r)),
                                          child: TextButton.icon(
                                            onPressed: () {
                                              _showAlertDialog(context);
                                              //pickImage(ImageSource.camera);
                                            },
                                            icon: Icon(
                                              Icons.upload_file,
                                              color: AppColor.appWhite,
                                            ),
                                            label: Text(
                                              'ອັບໂຫຼດໄຟຣ໌',
                                              style: TextStyle(color: AppColor.appWhite),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              : const SizedBox(),
                          SizedBox(
                            height: 50.h,
                          ),
                          BottomWidget(
                            title: 'ລົງທະບຽນ',
                            onTap: () async {
                              // Navigator.push(context, MaterialPageRoute(builder: (_) => const MainOTP()));
                              if (_form.currentState!.validate()) {
                                await AuthService().register(context, name.text, email.text, tell.text, password.text,
                                    base64String, selectindex.toString());
                              }
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ທ່ານມີບັນຊີແລ້ວ ຫຼືບໍ່?",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColor.appGray,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const LoginPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'ເຂົ້າສູ່ລະບົບ',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: AppColor.appRed,
                                    ),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Center(
                            child: Text(
                              "ຫຼື ເຂົ້າສູ່ລະບົບຜ່ານ",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColor.appGray,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GoogleButton(),
                              FaceBookButton(),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }

  // This shows a CupertinoModalPopup which hosts a CupertinoAlertDialog.
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text("ເລືອກໄຟຈາກ"),
        content: Row(
          children: [
            Expanded(
                child: CupertinoButton(
              onPressed: () {
                pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
              child: const Icon(Icons.image_outlined),
            )),
            Expanded(
                child: CupertinoButton(
              onPressed: () {
                // Add your onPressed logic here
                pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
              child: const Icon(Icons.camera_alt_outlined),
            )),
          ],
        ),
      ),
    );
  }
}
