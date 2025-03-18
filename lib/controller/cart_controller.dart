import 'package:ecommere_user/core/class/statusrequest.dart';
import 'package:ecommere_user/core/constant/routes.dart';
import 'package:ecommere_user/core/functions/handingdatacontroller.dart';
import 'package:ecommere_user/core/services/services.dart';
import 'package:ecommere_user/data/datasource/remote/cart_data.dart';
import 'package:ecommere_user/data/model/cartmodel.dart';
import 'package:ecommere_user/data/model/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  TextEditingController? coboncontroller;
  MyServices myServices = Get.find();
  CartDat cartDat = CartDat(Get.find());
  late StatusRequest statusRequest;
  List<CartModel> data = [];
  double pricetotal = 0.0;
  int countitems = 0;
  CouponModel? couponModel;
  double coupondiscount = 0;
  String? couponname;
  String? couponid;

  cartAdd(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartDat.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("Success", "Saved to Cart");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  cartRemove(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartDat.removeCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("Remove", "Remove From Cart");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // cartCount(String itemsid) async {
  //   var response = await cartDat.countCart(
  //       myServices.sharedPreferences.getString("id")!, itemsid);
  //   print(response);
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       int count = 0;
  //       count = response["data"];
  //       return count;
  //     }
  //   }
  //   update();
  // }
  double getTotalProce() {
    if (coupondiscount == 0) {
      return pricetotal + 10;
    } else {
      return pricetotal - pricetotal * coupondiscount / 100 + 50;
    }
  }

  resetVarCart() {
    pricetotal = 0.0;
    countitems = 0;
    data.clear();
  }

  reFreshPage() {
    resetVarCart();
    cartView();
  }

  cartView() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartDat.viewCart(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response["datacart"]["status"] == "success") {
          List respnosebody = response["datacart"]["data"];
          data.clear();
          data.addAll(respnosebody.map((e) => CartModel.fromJson(e)));
          Map dataresponse = response["countprice"];
          pricetotal = double.parse(dataresponse["totalprice"].toString());
          countitems = int.parse(dataresponse["totalitem"].toString());
        }
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartDat.checkCoupon(coboncontroller!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response["data"];
        couponModel = CouponModel.fromJson(datacoupon);
        coupondiscount = double.parse(couponModel!.couponDiscount!);
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId;
      } else {
        Get.snackbar("Warning", "Coupon Not Valid");
      }
    } else {
      couponid = null;
      coupondiscount = 0;
      couponname = null;
    }
    update();
  }

  goToPageCheckOut() {
    if (data.isEmpty) return Get.snackbar("error", "Cart Is Empty");
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponid ?? "0",
      "pricetotal": pricetotal.toString(),
      "coupondiscount": coupondiscount.toString(),
    });
  }

  @override
  void onInit() {
    coboncontroller = TextEditingController();
    cartView();
    super.onInit();
  }
}
