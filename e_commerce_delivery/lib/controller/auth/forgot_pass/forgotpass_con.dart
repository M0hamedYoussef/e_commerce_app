import 'package:e_commerce_delivery/core/class/request_status.dart';
import 'package:e_commerce_delivery/core/functions/loading.dart';
import 'package:e_commerce_delivery/core/functions/status_update.dart';
import 'package:e_commerce_delivery/data/datasource/remote/auth/forgot_pass/forgot_pass_data.dart';
import 'package:e_commerce_delivery/view/screens/auth/forgot_pass/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassCon extends GetxController {
  final GlobalKey<FormState> fst = GlobalKey<FormState>();
  final FocusNode fstEmailFocus = FocusNode();
  TextEditingController emailCon = TextEditingController();
  late RequsetStatus requsetStatus;
  ForgotPassData forgotPassData = ForgotPassData(crud: Get.find());

  goToVerify() {
    Get.to(
      VerifyScreen(
        email: emailCon.text,
        resetPass: true,
      ),
    );
  }

  checkEmail() async {
    if (fst.currentState!.validate()) {
      requsetStatus = RequsetStatus.loading;
      loading();
      var response = await forgotPassData.giveData(
        email: emailCon.text,
      );
      Get.back();
      requsetStatus = statusUpdater(response: response);
      if (requsetStatus == RequsetStatus.success) {
        if (response['status'] == 'success') {
          goToVerify();
        } else if (response['status'] == 'not exists') {
          Get.defaultDialog(
            title: 'alert'.tr,
            middleText: 'emailNotExists'.tr,
          );
        }
      }
    }
  }
}
