import 'dart:async';
import 'package:e_commerce/controller/address/address_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/services/my_services.dart';
import 'package:e_commerce/data/datasource/remote/address_data.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressEditCon extends GetxController {
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(crud: Get.find());
  late AddressModel addressModel;
  late CameraPosition cameraPosition;
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

  Completer<GoogleMapController> controllerCompleter =
      Completer<GoogleMapController>();
  List<Marker> myMarkers = [];
  bool close = false;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    addressesList = myServices.addressesList;
    addressModel = Get.arguments['addressmodel'];

    nameCon.text = addressModel.addressName!;
    userPhoneCon.text = addressModel.userPhonenumber!;
    cityCon.text = addressModel.addressCity!;
    streetCon.text = addressModel.addressStreet!;

    cameraPosition = CameraPosition(
      target: LatLng(
        addressModel.addressLat!,
        addressModel.addressLong!,
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

  initUserData() {
    userID = myServices.sharedPreferences.getString('user_id')!;
    userName = myServices.sharedPreferences.getString('user_username')!;
    userEmail = myServices.sharedPreferences.getString('user_email')!;
    userPhone = myServices.sharedPreferences.getString('user_phone')!;
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

  checkInOrder() {
    dynamic check = false;
    for (int i = 0; i < myServices.ordersList.length; i++) {
      if (addressModel.addressId == myServices.ordersList[i]['address_id']) {
        check = true;
        break;
      } else {
        check = false;
      }
    }
    return check;
  }

  deleteData() async {
      await addressData.deleteData(
        userId: userID.toString(),
        addressId: addressModel.addressId.toString(),
      );
      addressesList.removeWhere(
        (element) => element['address_id'] == addressModel.addressId,
      );

      userPhoneCon.clear();
      nameCon.clear();
      cityCon.clear();
      streetCon.clear();
      closeMap();
 
  }

  updateData() async {
    await addressData.updateData(
      userId: userID,
      addressId: addressModel.addressId.toString(),
      userPhone: addressModel.userPhonenumber.toString(),
      city: addressModel.addressCity.toString(),
      street: addressModel.addressStreet.toString(),
      name: addressModel.addressName.toString(),
      lat: addressModel.addressLat.toString(),
      long: addressModel.addressLong.toString(),
    );
  }

  editValidate() async {
    if (fst.currentState != null && fst.currentState!.validate()) {
      if (checkInOrder() == false) {
        if (addressModel.userPhonenumber != userPhoneCon.text.trim() ||
            addressModel.addressName != nameCon.text.trim() ||
            addressModel.addressCity != cityCon.text.trim() ||
            addressModel.addressStreet != streetCon.text.trim() ||
            addressModel.addressLat != cameraPosition.target.latitude ||
            addressModel.addressLong != cameraPosition.target.longitude) {
          addressModel.userPhonenumber = userPhoneCon.text.trim();
          addressModel.addressName = nameCon.text.trim();
          addressModel.addressCity = cityCon.text.trim();
          addressModel.addressStreet = streetCon.text.trim();
          addressModel.addressLat = cameraPosition.target.latitude;
          addressModel.addressLong = cameraPosition.target.longitude;
          for (int i = 0; i < addressesList.length; i++) {
            if (addressesList[i]['address_id'] == addressModel.addressId) {
              addressesList[i]['user_phonenumber'] =
                  addressModel.userPhonenumber;
              addressesList[i]['address_name'] = addressModel.addressName;
              addressesList[i]['address_city'] = addressModel.addressCity;
              addressesList[i]['address_street'] = addressModel.addressStreet;
              addressesList[i]['address_lat'] = addressModel.addressLat;
              addressesList[i]['address_long'] = addressModel.addressLong;
              await updateData();
              closeMap();
              break;
            }
          }
        }
      } else {
        closeMap();
        Get.defaultDialog(
          title: 'alert'.tr,
          middleText: 'address_not_allowed'.tr,
          titleStyle: const TextStyle(
            color: AppColors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
          ),
          middleTextStyle: const TextStyle(
            color: AppColors.black,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            fontFamily: 'Cairo',
          ),
        );
      }
    }
  }

  @override
  void onClose() {
    AddressCon addressCon = Get.find();
    addressCon.update();
    super.onClose();
  }
}
