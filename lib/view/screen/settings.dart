import 'package:ecommere_user/controller/settings_controller.dart';
import 'package:ecommere_user/core/constant/color.dart';
import 'package:ecommere_user/core/constant/imgaeasset.dart';
import 'package:ecommere_user/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return ListView(
      children: [
        Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
          Container(height: Get.width / 3, color: AppColor.primaryColor),
          Positioned(
              top: Get.width / 3.9,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[100],
                  backgroundImage: const AssetImage(AppImageAsset.logo),
                ),
              )),
        ]),
        const SizedBox(height: 100),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              // ListTile(
              //   // onTap: () {},
              //   trailing: GetBuilder<SettingsController>(
              //     builder: (controller) => Switch(
              //         activeColor: AppColor.primaryColor,
              //         onChanged: (val) {
              //           controller.notificatinOnChange(val);
              //         },
              //         value: controller.isActive),
              //   ),
              //   title: const Text("Disable Notificatios"),
              // ),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRoute.addressview);
                },
                trailing: const Icon(Icons.location_on_outlined),
                title: const Text("Address"),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRoute.orderabinding);
                },
                trailing: const Icon(Icons.shopping_cart_checkout_outlined),
                title: const Text("Orders"),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRoute.orderaarchive);
                },
                trailing: const Icon(Icons.archive_outlined),
                title: const Text("Archice"),
              ),
              ListTile(
                onTap: () {},
                trailing: const Icon(Icons.help_outline_rounded),
                title: const Text("About us"),
              ),
              ListTile(
                onTap: () async {
                  await launchUrl(Uri.parse("tel:01096366301"));
                },
                trailing: const Icon(Icons.phone_callback_outlined),
                title: const Text("Contact us"),
              ),
              ListTile(
                onTap: () {
                  controller.logOut();
                },
                title: const Text("Logout"),
                trailing: const Icon(Icons.exit_to_app),
              ),
            ]),
          ),
        )
      ],
    );
  }
}
