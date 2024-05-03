import 'package:flutter/material.dart';

Color blacColor = Color(0xFF1B1B27);
Color mainColor = Color.fromARGB(255, 86, 139, 93);
Color WhiteColor = Color(0xFFFFFFFF);

Color scColor = Color.fromARGB(255, 166, 241, 176);

// Color mainColor = Color(0xFF539DAD);

Color greyColor = Colors.grey.shade200;

// Color greyColor = Color(0xffcfb5a6);

const textColor = Color(0xFF757575);
Widget crdientColor() {
  return Container(
      decoration: BoxDecoration(),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [blacColor, mainColor])),
      ));
}
