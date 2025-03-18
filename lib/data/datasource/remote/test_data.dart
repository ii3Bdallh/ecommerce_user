import 'package:ecommere_user/core/class/crud.dart';
import 'package:ecommere_user/linkapi.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
