// ignore: file_names
import 'dart:convert';

import 'package:ecommere_user/important.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:http/http.dart" as http;

//

getPolyLine(latstart, longstart, latdest, longdest) async {
  Set<Polyline> polylineset = {};
  List<LatLng> polylineCordinate = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$latstart,$longstart&destination=$latdest,$longdest&key=$googleMapaKey";
  var response = await http.post(Uri.parse(url));
  var responsebody = jsonDecode(response.body);
  var point = responsebody['routes'][0]['overview_polyline']['points'];
  List<PointLatLng> result = polylinePoints.decodePolyline(point);
  if (result.isNotEmpty) {
    for (var pointlatlong in result) {
      polylineCordinate
          .add(LatLng(pointlatlong.latitude, pointlatlong.longitude));
    }
  }
  Polyline polyline = Polyline(
    polylineId: const PolylineId("line"),
    color: const Color.fromARGB(255, 0, 0, 0),
    width: 5,
    points: polylineCordinate,
  );
  polylineset.add(polyline);
  return polylineset;
}
