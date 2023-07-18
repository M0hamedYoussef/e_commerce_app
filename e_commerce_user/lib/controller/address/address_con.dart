import 'dart:async';
import 'package:e_commerce/core/class/request_status.dart';
import 'package:e_commerce/core/functions/status_update.dart';
import 'package:e_commerce/core/services/my_services.dart';
import 'package:e_commerce/data/datasource/remote/address_data.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:e_commerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressCon extends GetxController {
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(crud: Get.find());
  ValueNotifier<RequsetStatus> requsetStatus =
      ValueNotifier(RequsetStatus.noState);
  late List addressesList;
  bool loading = false;
  String lang = '';
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

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    addressesList = myServices.addressesList;
    requsetStatus.addListener(
      () {
        if (requsetStatus.value == RequsetStatus.loading) {
          loading = true;
          update();
        } else {
          loading = false;
          update();
        }
      },
    );
    initUserData();
  }

  initUserData() {
    userID = myServices.sharedPreferences.getString('user_id')!;
    userName = myServices.sharedPreferences.getString('user_username')!;
    userEmail = myServices.sharedPreferences.getString('user_email')!;
    userPhone = myServices.sharedPreferences.getString('user_phone')!;
  }

  getData() async {
    requsetStatus.value = RequsetStatus.loading;
    var response = await myServices.getAddresses(userId: userID);
    requsetStatus.value = statusUpdater(response: response);
    if (requsetStatus.value == RequsetStatus.success) {
      if (response['status'] == 'success') {
        addressesList = myServices.addressesList;
      }
    }
    update();
  }

  updateList() {
    update();
  }

  goToDetails({required AddressModel addressModel}) {
    userPhoneCon.text = addressModel.userPhonenumber.toString();
    nameCon.text = addressModel.addressName.toString();
    cityCon.text = addressModel.addressCity.toString();
    streetCon.text = addressModel.addressStreet.toString();
    cameraPosition = CameraPosition(
      target: LatLng(addressModel.addressLat!, addressModel.addressLong!),
    );
    Get.toNamed(
      AppRoutes.addressDetails,
      arguments: {'addressmodel': addressModel},
    );
  }
}
