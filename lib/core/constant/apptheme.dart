import 'package:ecommere_user/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  appBarTheme: AppBarTheme(
      color: Colors.grey[50],
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: AppColor.primaryColor,
      ),
      titleTextStyle: const TextStyle(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 25)),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor),
  fontFamily: "PlayfairDisplay",
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  appBarTheme: AppBarTheme(
      color: Colors.grey[50],
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: AppColor.primaryColor,
      ),
      titleTextStyle: const TextStyle(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 25)),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor , 
      ),
  fontFamily: "Cairo",
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
  primarySwatch: Colors.blue,
);
