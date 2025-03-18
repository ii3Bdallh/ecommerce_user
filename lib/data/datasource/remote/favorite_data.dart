import 'package:ecommere_user/core/class/crud.dart';
import 'package:ecommere_user/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String id, String itemsid) async {
    var response = await crud
        .postData(AppLink.favoriteAdd, {"usersid": id, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String id, String itemsid) async {
    var response = await crud
        .postData(AppLink.favoriteRemove, {"usersid": id, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
