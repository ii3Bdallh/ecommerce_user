import 'package:ecommere_user/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtomCoubon extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtomCoubon(
      {super.key, required this.textbutton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(textbutton,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
