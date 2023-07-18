import 'package:e_commerce/core/class/request_status.dart';
import 'package:e_commerce/core/functions/loading.dart';
import 'package:e_commerce/core/functions/status_update.dart';
import 'package:e_commerce/core/services/my_services.dart';
import 'package:e_commerce/data/datasource/remote/auth/login_data.dart';
import 'package:e_commerce/routes.dart';
import 'package:e_commerce/view/screens/auth/forgot_pass/verify_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/controller/global/global_icon_con.dart';

GlobalIconCon _globalIconCon = Get.put(GlobalIconCon());

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

  toSignUp() {
    Get.toNamed(AppRoutes.signup);
    _globalIconCon.iconON = true;
    _globalIconCon.update();
  }

  setSharedPrefs({required Map data}) async {
    loading();
    await myServices.sharedPreferences
        .setString('user_id', '${data['user_id']}');
    await myServices.sharedPreferences
        .setString('user_username', '${data['user_username']}');
    await myServices.sharedPreferences
        .setString('user_email', '${data['user_email']}');
    await myServices.sharedPreferences
        .setString('user_phone', '${data['user_phone']}');
    await myServices.sharedPreferences
        .setString('user_created_time', '${data['user_created_time']}');
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
          if (checkbox == true) {
            await setSharedPrefs(data: responseData);
            await FirebaseMessaging.instance.subscribeToTopic('users');
            await FirebaseMessaging.instance
                .subscribeToTopic('users${responseData['user_id']}');
          }
          Get.offAllNamed(AppRoutes.home);
        } else if (response['status'] == 'not verified') {
          Get.snackbar('verifyEmailSent'.tr, 'checkYourEmail'.tr);
          Get.to(
            VerifyScreen(
              email: emailCon.text,
              resetPass: false,
            ),
          );
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
