import 'package:ecommere_user/controller/orders/tracking_controller.dart';
import 'package:ecommere_user/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingOrdersScreen extends StatelessWidget {
  const TrackingOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingOrdersController());
    return Scaffold(
      appBar: AppBar(title: const Text("Tracking Orders")),
      body: GetBuilder<TrackingOrdersController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                if (controller.ordersModel.ordersType == "0" &&
                    controller.ordersModel.ordersStatus == "3")
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: GoogleMap(
                        polylines: controller.polylineSet,
                        markers: controller.marker.toSet(),
                        mapType: MapType.normal,
                        initialCameraPosition: controller.cameraPosition!,
                        onMapCreated: (GoogleMapController controllermap) {
                          controller.gmc = controllermap;
                        },
                      ),
                    ),
                  ),
                // CustomButtomCoubon(
                //   text: "Done",
                //   paddinglenth: 0,
                //   width: 300,
                //   onPressed: () {
                //     controller.doneOrders();
                //   },
                // ),
                const SizedBox(
                  height: 10,
                )
              ],
            ));
      }),
    );
  }
}
