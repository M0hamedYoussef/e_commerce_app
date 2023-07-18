import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_delivery/controller/orders_con.dart';
import 'package:e_commerce_delivery/core/const/colors.dart';
import 'package:e_commerce_delivery/core/functions/loading.dart';
import 'package:e_commerce_delivery/core/functions/polyline.dart';
import 'package:e_commerce_delivery/core/services/my_services.dart';
import 'package:e_commerce_delivery/data/datasource/remote/orders/orders_data.dart';
import 'package:e_commerce_delivery/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class OrderDetailsCon extends GetxController {
  @override
  void onClose() {
    super.onClose();
    dispose();
  }

  MyServices myServices = Get.find();
  OrdersData ordersData = OrdersData(crud: Get.find());
  late Position currentPosition;
  late OrderModel orderModel;
  late LocationSettings locationSettings;
  late StreamSubscription<Position> positionStream;
  CameraPosition? cameraPosition;
  GoogleMapController? googleMapController;

  List<Marker> myMarkers = [];
  Set<Polyline> polylineSet = {};

  bool close = false;
  bool loadingForLocation = false;

  @override
  onInit() async {
    orderModel = Get.arguments['orderModel'];
    await initMap();
    streamLocation();
    streamToUser();
    super.onInit();
  }

  getMyLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.back();
      return Get.snackbar('alert'.tr, 'location_alert_1'.tr);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.back();
        return Get.snackbar('alert'.tr, 'location_alert_2'.tr);
      }
    } else if (permission == LocationPermission.deniedForever) {
      Get.back();
      return Get.snackbar('alert'.tr, 'location_alert_3'.tr);
    } else {
      currentPosition = await Geolocator.getCurrentPosition();
    }
  }

  initMap() async {
    loadingForLocation = true;
    update();
    await getMyLocation();
    await polylineGet();
    loadingForLocation = false;
    update();
    cameraPosition = CameraPosition(
      target: LatLng(
        currentPosition.latitude,
        currentPosition.longitude,
      ),
      zoom: 19,
    );
    myMarkers.clear();
    myMarkers.add(
      Marker(
        markerId: const MarkerId('mylocation'),
        position: cameraPosition!.target,
      ),
    );
    myMarkers.add(
      Marker(
        markerId: const MarkerId('orderlocation'),
        position: LatLng(orderModel.addressLat!, orderModel.addressLong!),
      ),
    );
  }

  polylineGet() async {
    polylineSet = await polyLinsGetGlobal(
      currentPosition: currentPosition,
      destLatLang: LatLng(orderModel.addressLat!, orderModel.addressLong!),
    );
  }

  streamLocation() {
    locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings).listen(
      (Position? position) async {
        if (position != null) {
          myMarkers.removeWhere(
              (element) => element.markerId.toString().contains('mylocation'));
          currentPosition = position;
          polylineGet();
          if (googleMapController != null) {
            await googleMapController!.animateCamera(
              CameraUpdate.newLatLng(
                LatLng(currentPosition.latitude, currentPosition.longitude),
              ),
            );
          }
        }
        update();
      },
    );
  }

  streamToUser() async {
    Timer.periodic(
      const Duration(seconds: 10),
      (timer) {
        FirebaseFirestore.instance
            .collection('delivery')
            .doc(orderModel.orderId.toString())
            .set(
          {
            'delivery_id':
                myServices.sharedPreferences.getString('delivery_id'),
            'lat': currentPosition.latitude,
            'long': currentPosition.longitude,
          },
        );
      },
    );
  }

  Future<bool> closeMap() {
    close = true;
    update();
    Get.back();
    return Future.value(false);
  }

  addMarker({required LatLng latLng}) {
    myMarkers.clear();
    myMarkers.add(
      Marker(
        markerId: const MarkerId(''),
        position: latLng,
      ),
    );
    cameraPosition = CameraPosition(
      target: LatLng(
        latLng.latitude,
        latLng.longitude,
      ),
      zoom: 10.4746,
    );
    update();
  }

  completeOrder() async {
    Get.defaultDialog(
      title: 'alert'.tr,
      middleText: 'sure_complete'.tr,
      titleStyle: const TextStyle(
        color: AppColors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontFamily: 'Cairo',
      ),
      middleTextStyle: const TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Cairo',
      ),
      actions: [
        MaterialButton(
          onPressed: () async {
            Get.back();
            loading();
            await ordersData.deliveredOrder(
              userId: orderModel.orderUserid.toString(),
              createdDate: orderModel.orderCreateddate!.substring(0, 10),
            );
            Get.back();
            Get.back();
            OrdersCon ordersCon = Get.find();
            ordersCon.getAccepted();
          },
          color: AppColors.blue,
          child: Text(
            'yes'.tr,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            Get.back();
          },
          color: AppColors.blue,
          child: Text(
            'no'.tr,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
          ),
        ),
      ],
    );
  }
}
