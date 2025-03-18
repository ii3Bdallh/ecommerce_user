import 'dart:async';

import 'package:ecommere_user/core/class/statusrequest.dart';
import 'package:ecommere_user/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  Completer<GoogleMapController>? completercontroller;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
  double? long;
  double? lat;
  addMarkers(LatLng latLng) {
    long = latLng.longitude;
    lat = latLng.latitude;
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latLng));
    update();
  }

  getCurrentLocatoin() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude), zoom: 14);
    addMarkers(LatLng(position!.latitude, position!.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  goToAddDetails() {
    Get.toNamed(AppRoute.addressadddetails, arguments: {
      "long": long.toString(),
      "lat": lat.toString(),
    });
  }

  @override
  void onInit() {
    getCurrentLocatoin();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
