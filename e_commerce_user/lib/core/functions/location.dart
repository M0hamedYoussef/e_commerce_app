import 'package:e_commerce/core/services/my_services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

MyServices _myServices = Get.find();
getLocation() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Get.snackbar('alert'.tr, 'location_alert_1'.tr);
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Get.snackbar('alert'.tr, 'location_alert_2'.tr);
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Get.snackbar('alert'.tr, 'location_alert_3'.tr);
  }
  _myServices.currentPosition = await Geolocator.getCurrentPosition();
  return _myServices.currentPosition;
}
