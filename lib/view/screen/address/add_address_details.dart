import 'package:ecommere_user/controller/address/adddetails_address_controller.dart';
import 'package:ecommere_user/core/class/handlingdataview.dart';
import 'package:ecommere_user/core/functions/validinput.dart';
import 'package:ecommere_user/view/widget/auth/custombuttonauth.dart';
import 'package:ecommere_user/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressDetails extends StatelessWidget {
  const AddAddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressControllerDetails controllerDetails =
        Get.put(AddAddressControllerDetails());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add address's Detials"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: HandlingDataView(
            statusRequest: controllerDetails.statusRequest!,
            widget: ListView(
              children: [
                CustomTextFormAuth(
                    hinttext: "username",
                    labeltext: "name",
                    iconData: Icons.person,
                    mycontroller: controllerDetails.name,
                    valid: (val) {
                      return validInput(val!, 3, 40, "username");
                    },
                    isNumber: false),
                CustomTextFormAuth(
                    hinttext: "city",
                    labeltext: "city",
                    iconData: Icons.location_city,
                    mycontroller: controllerDetails.city,
                    valid: (val) {
                      return validInput(val!, 3, 40, "username");
                    },
                    isNumber: false),
                CustomTextFormAuth(
                    hinttext: "Street",
                    labeltext: "Street",
                    iconData: Icons.streetview,
                    mycontroller: controllerDetails.street,
                    valid: (val) {
                      return validInput(val!, 3, 40, "username");
                    },
                    isNumber: false),
                CustomTextFormAuth(
                    hinttext: "Home",
                    labeltext: "home",
                    iconData: Icons.home,
                    mycontroller: controllerDetails.home,
                    valid: (val) {
                      return validInput(val!, 3, 40, "username");
                    },
                    isNumber: false),
                CustomTextFormAuth(
                    hinttext: "Floor",
                    labeltext: "Floor",
                    iconData: Icons.flood_rounded,
                    mycontroller: controllerDetails.floor,
                    valid: (val) {
                      return validInput(val!, 0, 40, "number");
                    },
                    isNumber: true),
                CustomTextFormAuth(
                    hinttext: "note",
                    labeltext: "note",
                    iconData: Icons.note,
                    mycontroller: controllerDetails.note,
                    valid: (val) {
                      return validInput(val!, 3, 100, "username");
                    },
                    isNumber: false),
                CustomTextFormAuth(
                    hinttext: "Phone Number",
                    labeltext: "Phone",
                    iconData: Icons.phone,
                    mycontroller: controllerDetails.phone,
                    valid: (val) {
                      return validInput(val!, 3, 40, "phone");
                    },
                    isNumber: true),
                CustomButtomAuth(
                  text: "Add Address",
                  onPressed: () {
                    controllerDetails.addAddress();
                  },
                )
              ],
            )),
      ),
    );
  }
}
