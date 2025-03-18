import 'package:ecommere_user/core/class/crud.dart';
import 'package:ecommere_user/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  getData(String usersid) async {
    var response =
        await crud.postData(AppLink.notification, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
