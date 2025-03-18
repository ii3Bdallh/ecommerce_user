import 'package:ecommere_user/core/class/crud.dart';
import 'package:ecommere_user/linkapi.dart';

class OrdersData {
  Crud crud;
  OrdersData(this.crud);
  orderBindig(String id) async {
    var response = await crud.postData(AppLink.bindingorder, {"usersid": id});
    return response.fold((l) => l, (r) => r);
  }

  orderArchive(String id) async {
    var response = await crud.postData(AppLink.archiveorder, {"usersid": id});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String ordereid) async {
    var response = await crud.postData(AppLink.deleteorder, {"id": ordereid});
    return response.fold((l) => l, (r) => r);
  }
}
