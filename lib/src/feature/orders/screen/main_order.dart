import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainOrder extends StatefulWidget {
  const MainOrder({super.key});

  @override
  State<MainOrder> createState() => _MainOrderState();
}

class _MainOrderState extends State<MainOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ຕະກ້າ"),
      ),
      body: Center(
        child: Text("Hiiii"),
      ),
    );
  }
}