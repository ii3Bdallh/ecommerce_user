import 'package:ecommere_user/controller/home_controller.dart';
import 'package:ecommere_user/core/class/statusrequest.dart';
import 'package:ecommere_user/core/functions/handingdatacontroller.dart';
import 'package:ecommere_user/data/datasource/remote/offer_data.dart';
import 'package:ecommere_user/data/model/itemsmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OfferController extends SearchController {
  OfferData offerData = OfferData(Get.find());
  List<ItemsModel> data = [];

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await offerData.getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata1 = response["data"];

        data.clear();
        data.addAll(listdata1.map((e) => ItemsModel.fromJson(e)));
        // print("===============================");
        // print(data[0].favorite);
        // print(data[1].favorite);
        // print(data[2].favorite);
        // print("===============================");
        listdata1.clear();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  refrechData() {
    getData();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}
