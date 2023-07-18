import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/functions/polyline.dart';
import 'package:e_commerce/core/services/my_services.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class OrdersMapCon extends GetxController {
  MyServices myServices = Get.find();
  late ItemsModel orderModel;
  late LocationSettings locationSettings;
  late StreamSubscription<Position> positionStream;
  CameraPosition? cameraPosition;
  Completer<GoogleMapController> googleMapController =
      Completer<GoogleMapController>();
  List<Marker> myMarkers = [];
  Set<Polyline> polylineSet = {};

  LatLng deliveryPos = const LatLng(0, 0);

  bool close = false;
  bool loadingForLocation = false;

  @override
  onInit() async {
    orderModel = Get.arguments['orderModel'];
    streamLocation();
    await initMap();
    super.onInit();
  }

  initMap() async {
    loadingForLocation = true;
    update();
    myMarkers.add(
      Marker(
        markerId: const MarkerId('orderLocation'),
        position: LatLng(
          orderModel.addressLat!,
          orderModel.addressLong!,
        ),
      ),
    );
    await polylineGet();
  }

  polylineGet() async {
    polylineSet = await polyLinsGetGlobal(
      currentPosition: deliveryPos,
      destLatLang: LatLng(orderModel.addressLat!, orderModel.addressLong!),
    );
  }

  streamLocation() {
    FirebaseFirestore.instance
        .collection('delivery')
        .doc(orderModel.orderId.toString())
        .snapshots()
        .listen(
      (event) async {
        Map<String, dynamic>? data = event.data();
        if (data != null) {
          deliveryPos = LatLng(
            data['lat'],
            data['long'],
          );
          cameraPosition = CameraPosition(
            target: deliveryPos,
            zoom: 19,
          );
          loadingForLocation = false;
          await polylineGet();
          myMarkers.clear();
          myMarkers.add(
            Marker(
              markerId: const MarkerId('orderLocation'),
              position: LatLng(
                orderModel.addressLat!,
                orderModel.addressLong!,
              ),
            ),
          );
          myMarkers.add(
            Marker(
              markerId: const MarkerId('deliveryLocation'),
              position: deliveryPos,
            ),
          );
          if (googleMapController.isCompleted) {
            googleMapController.future.then(
              (value) => value.animateCamera(
                CameraUpdate.newLatLng(
                  LatLng(
                    data['lat'],
                    data['long'],
                  ),
                ),
              ),
            );
          }
          update();
        }
      },
    );
  }

  Future<bool> closeMap() {
    close = true;
    update();
    Get.back();
    return Future.value(false);
  }
}
