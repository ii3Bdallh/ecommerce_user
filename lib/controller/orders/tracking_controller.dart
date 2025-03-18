import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommere_user/core/class/statusrequest.dart';
import 'package:ecommere_user/core/services/services.dart';
import 'package:ecommere_user/data/model/orders_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingOrdersController extends GetxController {
  GoogleMapController? gmc;
  CameraPosition? cameraPosition;
  List<Marker> marker = [];
  StatusRequest statusRequest = StatusRequest.success;
  MyServices myServices = Get.find();
  late OrdersModel ordersModel;
  Set<Polyline> polylineSet = {};
  double? destlat;
  double? destlong;
  double? currenttlat;
  double? currenttlont;

getCurrentLocation() {
  double lat = double.tryParse(ordersModel.addressLat ?? "0.0") ?? 0.0;
  double long = double.tryParse(ordersModel.addressLong ?? "0.0") ?? 0.0;

  cameraPosition = CameraPosition(
    target: LatLng(lat, long),
    zoom: 12.4746,
  );

  marker.add(Marker(
    markerId: const MarkerId("current"),
    position: LatLng(lat, long),
  ));

  update();
}

  getDeliveryLocation() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(ordersModel.ordersId)
        .snapshots()
        .listen((event) {
      destlat = event.get("Lat");
      destlong = event.get("Long");
      updateMarekerDelivery(destlat!, destlong!);
    });
  }

  updateMarekerDelivery(double newlat, double newlong) {
    marker.removeWhere((element) => element.markerId.value == "dest");
    marker.add(Marker(
        markerId: const MarkerId("dest"), position: LatLng(newlat, newlong)));
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments["ordersModel"];
    getCurrentLocation();
    getDeliveryLocation();
    // reFrechLocation();
    super.onInit();
  }

  @override
  void onClose() {
    gmc!.dispose();
    super.onClose();
  }

  // initPolyLine() async {
  //   destlat = ordersModel.addressLat!;
  //   destlong = ordersModel.addressLong!;
  //   print("==========================================");
  //   print("currenttlat $currenttlat");
  //   print("currenttlont $currenttlont");
  //   print("destlat $destlat");
  //   print("destlong $destlong");
  //   print("==========================================");
  //   await Future.delayed(const Duration(seconds: 1));
  //   polylineSet =
  //       await getPolyLine(currenttlat!, currenttlont!, destlat!, destlong!);
  //   update();
  // }
}
