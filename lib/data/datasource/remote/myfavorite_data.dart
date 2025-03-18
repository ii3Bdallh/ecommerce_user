import 'package:ecommere_user/core/class/crud.dart';
import 'package:ecommere_user/linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  viewFavorite(String id) async {
    var response = await crud.postData(AppLink.favoriteView, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  deleteFavorite(String itemsid) async {
    var response =
        await crud.postData(AppLink.deletefromfavroite, {"id": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
