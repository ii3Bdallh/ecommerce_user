import 'package:ecommere_user/core/class/statusrequest.dart';
import 'package:ecommere_user/core/functions/handingdatacontroller.dart';
import 'package:ecommere_user/core/services/services.dart';
import 'package:ecommere_user/data/datasource/remote/cart_data.dart';
import 'package:ecommere_user/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;
  int count = 0;
  late StatusRequest statusRequest;

  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    count = await cartCount(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  MyServices myServices = Get.find();
  CartDat cartDat = CartDat(Get.find());

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

  cartCount(String itemsid) async {
    var response = await cartDat.countCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int count = 0;
        count = response["data"];
        return count;
      }
    }
    update();
  }

  add() {
    cartAdd(itemsModel.itemsId!);
    count++;
    update();
  }

  remove() {
    if (count > 0) {
      cartRemove(itemsModel.itemsId!);
      count--;
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
