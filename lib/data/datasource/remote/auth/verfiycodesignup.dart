import 'package:ecommere_user/core/class/crud.dart';
import 'package:ecommere_user/linkapi.dart';

class VerfiyCodeSignUpData {
  Crud crud;
  VerfiyCodeSignUpData(this.crud);
  postdata(String email, String verifycode) async {
    var response = await crud.postData(
        AppLink.verifycodessignup, {"email": email, "verifycode": verifycode});
    return response.fold((l) => l, (r) => r);
  }

  reSendData(String email) async {
    var response = await crud.postData(AppLink.resend, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
