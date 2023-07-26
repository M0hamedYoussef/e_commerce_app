import 'dart:async';
import 'package:e_commerce/controller/address/address_con.dart';
import 'package:e_commerce/core/services/my_services.dart';
import 'package:e_commerce/data/datasource/remote/address_data.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAddCon extends GetxController {
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(crud: Get.find());

  late List addressesList;
  late String userID;
  late String userName;
  late String userEmail;
  late String userPhone;
  final GlobalKey<FormState> fst = GlobalKey<FormState>();

  FocusNode nameFocus = FocusNode();
  FocusNode userPhoneFocus = FocusNode();
  FocusNode cityFocus = FocusNode();
  FocusNode streetFocus = FocusNode();

  TextEditingController userPhoneCon = TextEditingController();
  TextEditingController cityCon = TextEditingController();
  TextEditingController streetCon = TextEditingController();
  TextEditingController nameCon = TextEditingController();

  late CameraPosition cameraPosition;
  Completer<GoogleMapController> controllerCompleter =
      Completer<GoogleMapController>();
  List<Marker> myMarkers = [];
  bool close = false;
  bool getData = false;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    addressesList = myServices.addressesList;
    cameraPosition = CameraPosition(
      target: LatLng(
        myServices.currentPosition.latitude,
        myServices.currentPosition.longitude,
      ),
      zoom: 10.4746,
    );
    myMarkers.clear();
    myMarkers.add(
      Marker(
        markerId: const MarkerId(''),
        position: cameraPosition.target,
      ),
    );
    update();

    initUserData();
  }

  Future<bool> closeMap() {
    close = true;
    update();
    Get.back();
    return Future.value(false);
  }

  initUserData() {
    userID = myServices.sharedPreferences.getString('user_id')!;
    userName = myServices.sharedPreferences.getString('user_username')!;
    userEmail = myServices.sharedPreferences.getString('user_email')!;
    userPhone = myServices.sharedPreferences.getString('user_phone')!;
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

  insertData({
    required AddressModel addressModel,
  }) async {
    await addressData.insertData(
      userId: userID.toString(),
      userPhone: addressModel.userPhonenumber.toString(),
      city: addressModel.addressCity.toString(),
      street: addressModel.addressStreet.toString(),
      name: addressModel.addressName.toString(),
      lat: addressModel.addressLat.toString(),
      long: addressModel.addressLong.toString(),
    );
  }

  addValidate() async {
    if (fst.currentState != null && fst.currentState!.validate()) {
      await insertData(
        addressModel: AddressModel.fromJson(
          {
            'address_name': nameCon.text,
            'address_phonenumber': userPhoneCon.text,
            'address_city': cityCon.text,
            'address_street': streetCon.text,
            'address_lat': cameraPosition.target.latitude,
            'address_long': cameraPosition.target.longitude,
          },
        ),
      );
      userPhoneCon.clear();
      nameCon.clear();
      cityCon.clear();
      streetCon.clear();
      getData = true;
      closeMap();
    }
  }

  @override
  void onClose() {
    if (getData) {
      AddressCon addressCon = Get.find();
      addressCon.getData();
    }
    super.onClose();
  }
}
