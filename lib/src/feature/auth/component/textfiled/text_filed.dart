// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFiledWidget extends StatefulWidget {
  IconData icon;
  TextEditingController controller;
  String hintText;
  bool hide;
  FormFieldValidator validator;
  TextFiledWidget({
    super.key,
    required this.icon,
    required this.controller,
    required this.hintText,
    required this.hide,
    required this.validator,
  });

  @override
  State<TextFiledWidget> createState() => _TextFiledWidgetState();
}

class _TextFiledWidgetState extends State<TextFiledWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: TextInputType.text,
      obscureText: widget.hide,
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10.r),
        ),
        hintText: widget.hintText,
        prefixIcon: Icon(widget.icon),
        filled: true,
      ),
    );
  }
}
