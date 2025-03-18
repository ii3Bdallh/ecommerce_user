import 'package:ecommere_user/core/constant/color.dart';
import 'package:flutter/material.dart';

class MethodsOfPaymant extends StatelessWidget {
  final String name;
  final bool isactive;

  const MethodsOfPaymant({
    super.key,
    required this.name,
    required this.isactive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isactive == true ? AppColor.primaryColor : AppColor.thirdColor,
      ),
      child: Text(
        name,
        style: TextStyle(
            color: isactive == true ? Colors.white : AppColor.secondColor,
            fontWeight: FontWeight.bold,
            height: 1),
      ),
    );
  }
}
