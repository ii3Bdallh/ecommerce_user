import 'package:ecommere_user/core/class/statusrequest.dart';
import 'package:ecommere_user/core/functions/handingdatacontroller.dart';
import 'package:ecommere_user/core/services/services.dart';
import 'package:ecommere_user/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

class FavoriteOfferController extends GetxController {
  Map isFavorite = {};
  MyServices myServices = Get.find();
  FavoriteData favoritedata = FavoriteData(Get.find());
  late StatusRequest statusRequest;
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  favoriteAdd(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoritedata.addFavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("Success", "Saved to Favorite");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  favoriteremove(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoritedata.removeFavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("Remove", "Remove From Favorite");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
