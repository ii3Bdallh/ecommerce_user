import 'package:ecommere_user/core/class/statusrequest.dart';
import 'package:ecommere_user/core/constant/routes.dart';
import 'package:ecommere_user/core/functions/handingdatacontroller.dart';
import 'package:ecommere_user/core/services/services.dart';
import 'package:ecommere_user/data/datasource/remote/address_data.dart';
import 'package:ecommere_user/data/datasource/remote/checkout_data.dart';
import 'package:ecommere_user/data/model/address_model.dart';
import 'package:get/get.dart';

class CheckOutCOntroller extends GetxController {
  AddressData addressData = AddressData(Get.find());
  CheckOutData checkOutData = CheckOutData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  List<AddressModel> data = [];

  String? paymantmethod;
  String? delivertype;
  String? shippingaddress;
  late String couponid;
  late String totalprice;
  late String coupondiscount;
  choosePaymant(String val) {
    paymantmethod = val;
    update();
  }

  chooseDelivary(String val) {
    delivertype = val;
    update();
  }

  chooseAddress(String val) {
    shippingaddress = val;
    update();
  }

  getDataAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .viewData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsebody = response["data"];
        data.addAll(responsebody.map((e) => AddressModel.fromJson(e)));
      } else {}
      // End
    }
    update();
  }

  addCheckOut() async {
    if (paymantmethod == null) {
      return Get.snackbar("Error", "Choose Paymant Method");
    }
    if (delivertype == null) {
      return Get.snackbar("Error", "Choose Delivery Type");
    }
    if (delivertype == "0" && shippingaddress == null) {
      return Get.snackbar("Error", "Choose Address");
    }
    if (data.isEmpty) {
      return Get.snackbar("Error", "You Don't Have An Address");
    }

    Map data1 = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addresid": shippingaddress.toString(),
      "orderstype": delivertype.toString(),
      "pricedelivery": "10",
      "orderprice": totalprice,
      "couponid": couponid,
      "paymantmethod": paymantmethod.toString(),
      "coupondiscount": coupondiscount,
    };
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkOutData.addCheckOut(data1);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("Seccess", "The Order Was Seccessfully");
        Get.offAllNamed(AppRoute.homepage);
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "try Again Please");
      }

      // End
    }
    update();
  }

  @override
  void onInit() {
    totalprice = Get.arguments["pricetotal"];
    couponid = Get.arguments["couponid"];
    coupondiscount = Get.arguments["coupondiscount"];
    getDataAddress();
    super.onInit();
  }
}
