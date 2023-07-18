import 'package:e_commerce/core/class/request_status.dart';
import 'package:e_commerce/core/functions/loading.dart';
import 'package:e_commerce/core/functions/status_update.dart';
import 'package:e_commerce/data/datasource/remote/auth/signup_data.dart';
import 'package:e_commerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpCon extends GetxController {
  final TextEditingController userCon = TextEditingController();
  final TextEditingController teleCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();
  final GlobalKey<FormState> fst = GlobalKey<FormState>();
  final FocusNode fstUserFocus = FocusNode();
  final FocusNode fstTeleFocus = FocusNode();
  final FocusNode fstEmailFocus = FocusNode();
  final FocusNode fstPassFocus = FocusNode();
  late RequsetStatus requsetStatus;
  SignUpData signUpData = SignUpData(crud : Get.find());

  goToVerify() {
    Get.toNamed(AppRoutes.signupVerify);
  }

  signUp() async {
    if (fst.currentState!.validate()) {
      requsetStatus = RequsetStatus.loading;
      loading();
      var response = await signUpData.giveData(
        username: userCon.text,
        email: emailCon.text,
        phone: teleCon.text,
        password: passCon.text,
      );
      Get.back();
      requsetStatus = statusUpdater(response: response);
      if (requsetStatus == RequsetStatus.success) {
        if (response['status'] == 'success') {
          goToVerify();
        } else {
          Get.defaultDialog(
            title: 'faliure'.tr,
            middleText: 'alreadyExists'.tr,
          );
        }
      }
    }
  }
}
