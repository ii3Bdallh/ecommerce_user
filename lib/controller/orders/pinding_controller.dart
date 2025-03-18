import 'package:ecommere_user/core/class/statusrequest.dart';
import 'package:ecommere_user/core/constant/routes.dart';
import 'package:ecommere_user/core/functions/handingdatacontroller.dart';
import 'package:ecommere_user/core/services/services.dart';
import 'package:ecommere_user/data/datasource/remote/orders/orders_data.dart';
import 'package:ecommere_user/data/model/orders_model.dart';
import 'package:get/get.dart';

class BindingController extends GetxController {
  List<OrdersModel> data = [];
  OrdersData bindingdata = OrdersData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await bindingdata
        .orderBindig(myServices.sharedPreferences.getString("id")!);
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

  deleteData(String orderid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await bindingdata.deleteData(orderid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        refreshorder();
      } else {
        statusRequest = StatusRequest.none;
      }
    }
    update();
  }

  trackingOrder(OrdersModel ordersmodel) async {
    Get.toNamed(AppRoute.tracking, arguments: {"ordersModel": ordersmodel});
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

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Await Appoval";
    } else if (val == "1") {
      return "The Order Is Beeing Prepared";
    } else if (val == "2") {
      return "The Order with delivery";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
