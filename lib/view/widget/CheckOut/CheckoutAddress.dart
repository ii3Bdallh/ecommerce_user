import 'package:ecommere_user/core/constant/color.dart';
import 'package:flutter/material.dart';

class CheckOutAddress extends StatelessWidget {
  final String title;
  final String body;
  final bool isacive;
  const CheckOutAddress(
      {super.key,
      required this.title,
      required this.body,
      required this.isacive});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isacive == true ? AppColor.primaryColor : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: isacive == true ? Colors.white : AppColor.primaryColor,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(body,
            style: TextStyle(
                color: isacive == true ? Colors.white : AppColor.primaryColor,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
