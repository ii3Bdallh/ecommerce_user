import 'package:ecommere_user/core/constant/routes.dart';
import 'package:ecommere_user/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  bool isActive = true;
  late List<Map<String, dynamic>> listTileData;

  void logOut() {
    String userssdid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userssdid");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }

  notificatinOnChange(val) {
    isActive = val;
    update();
  }
}
// listTileData = [
    //   {
    //     "icon": Icons.notifications_active_outlined,
    //     "title": "Disable notification",
    //     "onTap": () {},
    //   },
    //   {
    //     "icon": Icons.location_on_outlined,
    //     "title": "Address",
    //     "onTap": () {},
    //   },
    //   {
    //     "icon": Icons.help_outline_rounded,
    //     "title": "About us",
    //     "onTap": () {},
    //   },
    //   {
    //     "icon": Icons.phone_enabled_rounded,
    //     "title": "Connect us",
    //     "onTap": () {},
    //   },
    //   {
    //     "icon": Icons.exit_to_app_outlined,
    //     "title": "LogOut",
    //     "onTap": logOut,
    //   },
    // ];