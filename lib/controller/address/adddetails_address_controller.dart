import 'package:ecommere_user/core/class/statusrequest.dart';
import 'package:ecommere_user/core/constant/routes.dart';
import 'package:ecommere_user/core/functions/handingdatacontroller.dart';
import 'package:ecommere_user/core/services/services.dart';
import 'package:ecommere_user/data/datasource/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressControllerDetails extends GetxController {
  StatusRequest? statusRequest;
  String? lat;
  String? long;
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? phone;
  TextEditingController? home;
  TextEditingController? note;
  TextEditingController? floor;
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());
  initailData() {
    statusRequest = StatusRequest.loading;
    update();
    lat = Get.arguments["lat"].toString();
    long = Get.arguments["long"].toString();
    statusRequest = StatusRequest.success;
    update();
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
        myServices.sharedPreferences.getString("id")!,
        name!.text,
        phone!.text,
        city!.text,
        street!.text,
        long!,
        lat!,
        home!.text,
        floor!.text,
        note!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.offAllNamed(AppRoute.homepage);
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    phone = TextEditingController();
    home = TextEditingController();
    floor = TextEditingController();
    note = TextEditingController();
    initailData();
    super.onInit();
  }
}
