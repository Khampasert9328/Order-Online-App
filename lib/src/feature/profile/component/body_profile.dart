// ignore_for_file: avoid_unnecessary_containers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:order_online_app/src/constants/image_path.dart';
import 'package:order_online_app/src/constants/set_color.dart';
import 'package:order_online_app/src/feature/auth/provider/version_provider.dart';
import 'package:order_online_app/src/feature/provider/provicer_service.dart';
import 'package:provider/provider.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({super.key});

  @override
  State<BodyProfile> createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProviderService>().getProfilePro();
      // context.read<VersionProvider>().getVersion();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderService>(builder: (ctn, model, children) {
      if (model.profile == null) {
        return Center(
          child: Lottie.asset(
            AppImage.loadingpage,
            height: 100.h,
            width: 100.w,
          ),
        );
      }
      return ListView.builder(
          itemCount: model.profile?.data.length,
          itemBuilder: (context, index) {
            final data = model.profile?.data[index];
            ImageProvider _getProfileImage(String? imageUrl) {
              if (imageUrl != null && imageUrl.isNotEmpty) {
                return CachedNetworkImageProvider(imageUrl);
              } else {
                // Return a placeholder image or a default image in case 'imageUrl' is null or empty.
                return const AssetImage('assets/images/people.png');
              }
            }

            ImageProvider profileImage = _getProfileImage(data?.profileImage);
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: profileImage,
                        ),
                        color: AppColor.appWhite,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: AppColor.appRed, width: 4),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.appWhite,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 0.1),
                        ),
                        BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, -0.1),
                        ),
                        BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(-0.1, 0),
                        ),
                        BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0.1, 0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person_outline_outlined),
                                border: InputBorder.none,
                                hintText: 'ຊື່: ${data?.fullname}'),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 45),
                            child: Divider(),
                          ),
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.people_alt_outlined),
                                border: InputBorder.none,
                                hintText: 'ນາມສະກຸນ: ${data?.lname}'),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 45),
                            child: Divider(),
                          ),
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email_outlined),
                                border: InputBorder.none,
                                hintText: 'ອີເມລ: ${data?.email}'),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 45),
                            child: Divider(),
                          ),
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone_callback_outlined),
                                border: InputBorder.none,
                                hintText: 'ເບີໂທ: ${data?.phone}'),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 45),
                            child: Divider(),
                          ),
                          // const TextField(
                          //   readOnly: true,
                          //   decoration: InputDecoration(
                          //       prefixIcon: Icon(Icons.person_outline_outlined),
                          //       border: InputBorder.none,
                          //       hintText: 'ຊື່ ແລະນາມສະກຸນ'),
                          // ),
                          // const Padding(
                          //   padding: EdgeInsets.only(left: 45),
                          //   child: Divider(),
                          // )
                        ],
                      ),
                    ),
                  ),
              
               
                ],
              ),
            );
          });
    });
  }
}
