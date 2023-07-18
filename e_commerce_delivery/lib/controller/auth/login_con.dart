import 'package:e_commerce_delivery/core/class/request_status.dart';
import 'package:e_commerce_delivery/core/functions/loading.dart';
import 'package:e_commerce_delivery/core/functions/status_update.dart';
import 'package:e_commerce_delivery/core/services/my_services.dart';
import 'package:e_commerce_delivery/data/datasource/remote/auth/login_data.dart';
import 'package:e_commerce_delivery/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginCon extends GetxController {
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();
  final GlobalKey<FormState> fst = GlobalKey<FormState>();
  final FocusNode fstEmailFocus = FocusNode();
  final FocusNode fstPassFocus = FocusNode();
  bool checkbox = false;

  late RequsetStatus requsetStatus;
  LoginData loginData = LoginData(crud: Get.find());
  MyServices myServices = Get.find();

  changeCheckBox() {
    checkbox = !checkbox;
    update();
  }

  setSharedPrefs({required Map data}) async {
    loading();
    await myServices.sharedPreferences
        .setString('delivery_id', '${data['delivery_id']}');
    await myServices.sharedPreferences
        .setString('delivery_username', '${data['delivery_username']}');
    await myServices.sharedPreferences
        .setString('delivery_email', '${data['delivery_email']}');
    await myServices.sharedPreferences
        .setString('delivery_phone', '${data['delivery_phone']}');
    await myServices.sharedPreferences
        .setString('delivery_created_time', '${data['delivery_created_time']}');
    await myServices.sharedPreferences.setBool('LoginSkip', true);
    Get.back();
  }

  login() async {
    if (fst.currentState!.validate()) {
      requsetStatus = RequsetStatus.loading;
      loading();
      var response = await loginData.giveData(
        email: emailCon.text,
        password: passCon.text,
      );
      requsetStatus = statusUpdater(response: response);
      if (requsetStatus == RequsetStatus.success) {
        if (response['status'] == 'success') {
          Map responseData = response['data'];
          await setSharedPrefs(data: responseData);
          await FirebaseMessaging.instance.subscribeToTopic('delivery');
          Get.offAllNamed(AppRoutes.home);
        } else if (response['status'] == 'not exists') {
          Get.back();
          Get.defaultDialog(title: 'alert'.tr, middleText: 'emailNotExists'.tr);
        } else if (response['status'] == 'wrong pass') {
          Get.back();
          Get.defaultDialog(title: 'alert'.tr, middleText: 'wrongPassword'.tr);
        }
      }
    }
  }
}
