import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_online_app/src/constants/set_color.dart';
import 'package:order_online_app/src/feature/auth/provider/set_provider_address.dart';
import 'package:order_online_app/src/feature/auth/provider/version_provider.dart';
import 'package:order_online_app/src/feature/auth/service/check_auth.dart';
import 'package:order_online_app/src/feature/provider/provicer_service.dart';
import 'package:order_online_app/src/utils/setData.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AddressProvider()),
            ChangeNotifierProvider(create: (_) => VersionProvider()),
            ChangeNotifierProvider(create: (_) => ProviderService()),
            ChangeNotifierProvider(create: (_)=>SetDataProvider())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                appBarTheme: AppBarTheme(
                    color: AppColor.appRed,
                    titleTextStyle: TextStyle(
                      fontFamily: 'NotoSansLao-Regular',
                      fontSize: 18.sp,
                    )),
                textTheme: const TextTheme(
                  bodyMedium: TextStyle(fontFamily: 'NotoSansLao-Regular'),
                  labelLarge: TextStyle(fontFamily: 'NotoSansLao-Regular'),
                )),
            home: const CheckAuth(),
          ),
        );
      },
    );
  }
}
