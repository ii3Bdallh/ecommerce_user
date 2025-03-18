import 'package:ecommere_user/core/class/crud.dart';
import 'package:ecommere_user/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  addData(String usersid, String name, String phone, String city, String street,
      String long, String lat, String home, String floor, String note) async {
    var response = await crud.postData(AppLink.addressadd, {
      "usersid": usersid,
      "name": name,
      "phone": phone,
      "city": city,
      "street": street,
      "long": long,
      "lat": lat,
      "home": home,
      "note": note,
      "floor": floor,
    });
    return response.fold((l) => l, (r) => r);
  }

  editData(String addressid, String name, String phone, String city,
      String street, String home, String floor, String note) async {
    var response = await crud.postData(AppLink.addressedit, {
      "addressid": addressid,
      "name": name,
      "phone": phone,
      "city": city,
      "street": street,
      "home": home,
      "note": note,
      "floor": floor,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeData(String addressid) async {
    var response =
        await crud.postData(AppLink.addressdelete, {"addressid": addressid});
    return response.fold((l) => l, (r) => r);
  }

  viewData(String usersid) async {
    var response =
        await crud.postData(AppLink.addressview, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
