// ignore_for_file: overridden_fields

import 'package:ecommere_user/core/class/statusrequest.dart';
import 'package:ecommere_user/core/constant/routes.dart';
import 'package:ecommere_user/core/functions/handingdatacontroller.dart';
import 'package:ecommere_user/core/services/services.dart';
import 'package:ecommere_user/data/datasource/remote/home_data.dart';
import 'package:ecommere_user/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends SearchController {
  initialData();
  getdata();
  goToItems(List categories, int selectedCat, String categoryid);
}

class HomeControllerImp extends HomeController {
  @override
  late StatusRequest statusRequest;
  @override
  HomeData homedata = HomeData(Get.find());
  @override
  MyServices myServices = Get.find();

  String? username;
  String? id;
  String? lang;
  String? titlehometext;
  String? bodyhometext;
  String? time;
  List categories = [];
  List items = [];
  List settings = [];

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']["data"]);
        items.addAll(response['items']["data"]);
        settings.addAll(response['settings']["data"]);
        titlehometext = settings[0]["settings_title"];
        bodyhometext = settings[0]["settings_body"];
        myServices.sharedPreferences
            .setString("time", settings[0]["settings_time"].toString());
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}

class SearchController extends GetxController {
  List<ItemsModel> listdata = [];
  MyServices myServices = Get.find();
  bool isSearrch = false;
  HomeData homedata = HomeData(Get.find());
  TextEditingController? search;
  late StatusRequest statusRequest;

  dataSearch() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsebody = response["data"];
        listdata.addAll(responsebody.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none; //114
      isSearrch = false;
      update();
    }
  }

  clearSearch() {}

  onSearch() {
    isSearrch = true;
    dataSearch();
    update();
  }
}
