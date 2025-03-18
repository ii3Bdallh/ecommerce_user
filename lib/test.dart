import 'package:ecommere_user/core/constant/color.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HIiiiiiiiiiii ",
          style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 50,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
