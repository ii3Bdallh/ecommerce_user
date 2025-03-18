import 'dart:io';
import 'package:ecommere_user/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "Notice",
      titleStyle: const TextStyle(
          color: AppColor.primaryColor, fontWeight: FontWeight.bold),
      middleText: "Are you want to leave the App",
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              exit(0);
            },
            child: const Text(
              "Confirm",
              style: TextStyle(color: Colors.white),
            )),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "Back",
              style: TextStyle(color: Colors.white),
            ))
      ]);
  return Future.value(true);
}
