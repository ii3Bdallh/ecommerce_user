import 'package:ecommere_user/core/class/statusrequest.dart';
import 'package:ecommere_user/core/functions/handingdatacontroller.dart';
import 'package:ecommere_user/core/services/services.dart';
import 'package:ecommere_user/data/datasource/remote/orders/orders_data.dart';
import 'package:ecommere_user/data/datasource/remote/orders/rating_data.dart';
import 'package:ecommere_user/data/model/orders_model.dart';
import 'package:get/get.dart';

class ArchiveController extends GetxController {
  List<OrdersModel> data = [];
  OrdersData archivedata = OrdersData(Get.find());
  RatingData ratingData = RatingData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await archivedata
        .orderArchive(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsebody = response["data"];
        data.addAll(responsebody.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.none;
      }
    }
    update();
  }

  sendRating(double rating, String comment, String ordersid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await ratingData.getData(ordersid, comment, rating.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getData();
      } else {}
    }
    update();
  }

  refreshorder() {
    getData();
  }

  String printTypeOrder(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recicve";
    }
  }

  String printPaymantMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Paymant Card";
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
