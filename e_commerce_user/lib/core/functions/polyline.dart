import 'dart:convert';
import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

polyLinsGetGlobal(
    {required LatLng currentPosition, required LatLng destLatLang}) async {
  Set<Polyline> polylineSet = {};
  List<LatLng> polyLatLng = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleApiKey = 'AIzaSyDiOXiTtZFfiX-42yt_LKAEb77qJ9eHivY';
  String origin =
      'origin=${currentPosition.latitude},${currentPosition.longitude}';
  String destination =
      'destination=${destLatLang.latitude},${destLatLang.longitude}';
  String rawLink = 'https://maps.googleapis.com/maps/api/directions/json?';
  String directionsApiLink = '$rawLink$origin&$destination&key=$googleApiKey';
  http.Response response = await http.post(
    Uri.parse(directionsApiLink),
  );
  Map responseBody = jsonDecode(response.body);
  String points = '';
  if (responseBody['status'] != 'ZERO_RESULTS') {
    points = responseBody['routes'][0]['overview_polyline']['points'];
  }
  List<PointLatLng> resultPoints = polylinePoints.decodePolyline(points);
  if (resultPoints.isNotEmpty) {
    for (PointLatLng point in resultPoints) {
      polyLatLng.add(LatLng(point.latitude, point.longitude));
    }
  }

  Polyline polyline = Polyline(
    polylineId: const PolylineId('meToAddress'),
    visible: true,
    points: polyLatLng,
    width: 7,
    color: AppColors.blue,
  );
  polylineSet.add(polyline);
  return polylineSet;
}
