import 'package:ecommere_user/core/class/statusrequest.dart';
import 'package:ecommere_user/core/functions/handingdatacontroller.dart';
import 'package:ecommere_user/core/services/services.dart';
import 'package:ecommere_user/data/datasource/remote/address_data.dart';
import 'package:ecommere_user/data/model/address_model.dart';
import 'package:get/get.dart';

class ViewAddressCOntroller extends GetxController {
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());
  List<AddressModel> data = [];

  getdata() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData
        .viewData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsebody = response["data"];
        data.addAll(responsebody.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deletedata(String addressid) {
    addressData.removeData(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  @override
  void onInit() {
    getdata();

    super.onInit();
  }
}
