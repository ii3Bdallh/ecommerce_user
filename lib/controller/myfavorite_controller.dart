import 'package:ecommere_user/core/class/statusrequest.dart';
import 'package:ecommere_user/core/functions/handingdatacontroller.dart';
import 'package:ecommere_user/core/services/services.dart';
import 'package:ecommere_user/data/datasource/remote/myfavorite_data.dart';
import 'package:ecommere_user/data/model/favoritemode.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  List<FavoriteModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getItems() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .viewFavorite(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        data.addAll(responsedata.map((e) => FavoriteModel.fromJson(e)));
        //يفضل استخدامه علشان بستخدم Model
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteItems(String id) {
    favoriteData.deleteFavorite(id);

    data.removeWhere((element) => element.favoriteId == id);
    update();
  }

  @override
  void onInit() {
    getItems();
    super.onInit();
  }

  // goToPageProductDetails(favoriteModel) {
  //   Get.toNamed("productdetails", arguments: {"favoriteModel": favoriteModel});
  // }
}

// class FavoriteController extends GetxController {
//   Map isFavorite = {};

//   setFavorite(id, val) {
//     isFavorite[id] = val;
//     print(isFavorite[id]);
//     update();
//   }
// }
