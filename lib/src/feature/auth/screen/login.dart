import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_online_app/src/constants/set_color.dart';
import 'package:order_online_app/src/feature/auth/componant/button/button.dart';
import 'package:order_online_app/src/feature/auth/componant/button/facebook_button.dart';
import 'package:order_online_app/src/feature/auth/componant/button/google_button.dart';
import 'package:order_online_app/src/feature/auth/componant/textfiled/text_filed.dart';
import 'package:order_online_app/src/feature/auth/screen/register.dart';
import 'package:order_online_app/src/feature/auth/service/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _form = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
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
                        "ເຂົ້າສູ່ລະບົບ",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Text(
                      //   "ຍິນດີຕ້ອນຮັບເຂົ້າສູ່ລະບົບຂອງພວກເຮົາ!",
                      //   style: TextStyle(fontSize: 15.sp, color: AppColor.appGray),
                      // ),
                      SizedBox(
                        height: 50.h,
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
                            return 'ກະລຸນາປ້ອນອີເມລ';
                          }
                          // Regular expression to match an email format
                          String emailPattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*$';
                          RegExp regex = RegExp(emailPattern);
                          if (!regex.hasMatch(value)) {
                            return 'ອີເມລບໍ່ຖືກຕ້ອງ';
                          }
                          return null; // Return null to indicate a valid email
                        },
                        hide: false,
                        hintText: 'ປ້ອນທີ່ຢູ່ອິເມລ',
                        controller: email,
                        icon: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: 20.h,
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
                            return 'ກາລຸນາປ້ອນລະຫັດຜ່ານ';
                          }
                          return null;
                        },
                        hide: false,
                        hintText: 'ປ້ອນລະຫັດຜ່ານ',
                        controller: password,
                        icon: Icons.lock_outlined,
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      BottomWidget(
                        title: 'ເຂົ້າສູ່ລະບົບ',
                        onTap: () {
                          if (_form.currentState!.validate()) {
                            AuthService().login(email.text, password.text, context);
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
                                    builder: (_) => const RegisterPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'ລົງທະບຽນ',
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
      ),
    );
  }
}
