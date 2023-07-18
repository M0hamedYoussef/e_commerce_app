import 'package:e_commerce_admin/core/functions/loading.dart';
import 'package:e_commerce_admin/core/services/my_services.dart';
import 'package:e_commerce_admin/data/datasource/remote/auth/login_data.dart';
import 'package:e_commerce_admin/routes.dart';
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
  LoginData loginData = LoginData(crud: Get.find());
  MyServices myServices = Get.find();

  changeCheckBox() {
    checkbox = !checkbox;
    update();
  }

  setSharedPrefs({required Map data}) async {
    await myServices.sharedPreferences
        .setString('admin_id', '${data['admin_id']}');
    await myServices.sharedPreferences
        .setString('admin_username', '${data['admin_username']}');
    await myServices.sharedPreferences
        .setString('admin_email', '${data['admin_email']}');
    await myServices.sharedPreferences
        .setString('admin_phone', '${data['admin_phone']}');
    await myServices.sharedPreferences
        .setString('admin_created_time', '${data['admin_created_time']}');
    await myServices.sharedPreferences.setBool('LoginSkip', true);
  }

  login() async {
    if (fst.currentState!.validate()) {
      loading();
      var response = await loginData.giveData(
        email: emailCon.text,
        password: passCon.text,
      );
      if (response['status'] == 'success') {
        if (checkbox) {
          Map responseData = response['data'];
          await setSharedPrefs(data: responseData);
          await FirebaseMessaging.instance.subscribeToTopic('admin');
        }
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
