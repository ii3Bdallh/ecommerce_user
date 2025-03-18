import 'package:ecommere_user/core/constant/color.dart';
import 'package:flutter/material.dart';

class CheckOutChoose extends StatelessWidget {
  final String title;
  const CheckOutChoose({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: AppColor.primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.bold),
    );
  }
}
