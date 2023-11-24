import 'package:flutter/cupertino.dart';
import 'package:order_online_app/src/feature/mainpage/home/component/menu_body.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child:  MenuBody()
    );
  }
}
