import 'package:ecommere_user/core/class/crud.dart';
import 'package:ecommere_user/linkapi.dart';

class OfferData {
  Crud crud;
  OfferData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.offers, {"usersid": id});
    return response.fold((l) => l, (r) => r);
  }
}
