// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_online_app/src/constants/set_color.dart';
import 'package:order_online_app/src/feature/auth/screen/main_auth.dart';
import 'package:order_online_app/src/utils/preference/set_preference.dart';

class LogOutDialog {
  void showLogOutDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('ແຈ້ງເຕືອນ'),
        content: const Text('ຕ້ອງການທີ່ຈະອອກຈາກລະບົບນີ້ແທ້ບໍ່?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'ບໍ່',
              style: TextStyle(color: AppColor.appBlack),
            ),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () async {
              await SetPreference().clearToken();
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (_) => const MainPageAuth()), (route) => false);
            },
            child: Text(
              'ຕົກລົງ',
              style: TextStyle(color: AppColor.appBlack),
            ),
          ),
        ],
      ),
    );
  }
}
