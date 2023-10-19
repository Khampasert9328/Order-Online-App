import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_online_app/src/feature/auth/provider/set_provider_address.dart';
import 'package:order_online_app/src/feature/auth/provider/version_provider.dart';
import 'package:order_online_app/src/feature/auth/screen/main_auth.dart';
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
            ChangeNotifierProvider(create: (_)=>VersionProvider())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme:  const TextTheme(
                bodyMedium: TextStyle(fontFamily: 'NotoSansLao-Regular'),
                labelLarge: TextStyle(fontFamily: 'NotoSansLao-Regular'),

              )
            ),
            home: const MainPageAuth(),
          ),
        );
      },
    );
  }
}
