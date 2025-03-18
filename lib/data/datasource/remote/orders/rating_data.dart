import 'package:ecommere_user/core/class/crud.dart';
import 'package:ecommere_user/linkapi.dart';

class RatingData {
  Crud crud;
  RatingData(this.crud);
  getData(String ordersid, String comment, String rating) async {
    var response = await crud.postData(AppLink.ratingorders,
        {"ordersid": ordersid, "rating": rating, "comment": comment});
    return response.fold((l) => l, (r) => r);
  }
}
