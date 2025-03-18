import 'package:ecommere_user/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardDeliveryTyoe extends StatelessWidget {
  final String imagename;
  final String title;
  final bool isactive;
  const CardDeliveryTyoe(
      {super.key,
      required this.imagename,
      required this.title,
      required this.isactive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
          color: isactive == true ? AppColor.primaryColor : null,
          border: Border.all(color: AppColor.secondColor)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          imagename,
          width: 60,
          fit: BoxFit.fill,
          color: isactive == true ? Colors.white : null,
        ),
        Text(
          title,
          style: TextStyle(
              color: isactive == true ? Colors.white : AppColor.secondColor,
              fontWeight: isactive == true ? FontWeight.bold : null),
        )
      ]),
    );
  }
}
