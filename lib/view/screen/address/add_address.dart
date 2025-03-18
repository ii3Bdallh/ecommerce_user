import 'package:ecommere_user/controller/address/add_address_controller.dart';
import 'package:ecommere_user/core/class/handlingdataview.dart';
import 'package:ecommere_user/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController controllerpage = Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add address"),
      ),
      body: Column(
        // Wrap with Column
        children: [
          Expanded(
            // Move Expanded outside of Stack
            child: GetBuilder<AddAddressController>(
              builder: (controller) {
                return HandlingDataView(
                    statusRequest: controllerpage.statusRequest,
                    widget: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        if (controllerpage.kGooglePlex != null)
                          GoogleMap(
                            mapType: MapType.normal,
                            markers: controllerpage.markers.toSet(),
                            onTap: (latlang) {
                              controllerpage.addMarkers(latlang);
                            },
                            initialCameraPosition: controllerpage.kGooglePlex!,
                            onMapCreated: (GoogleMapController controllermap) {
                              controllerpage.completercontroller!
                                  .complete(controllermap);
                            },
                          ),
                        MaterialButton(
                          minWidth: 200,
                          color: AppColor.primaryColor,
                          onPressed: () {
                            controllerpage.goToAddDetails();
                          },
                          child: const Text(
                            "Continue",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
