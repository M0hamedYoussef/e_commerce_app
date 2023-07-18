import 'package:e_commerce_admin/core/class/request_status.dart';
import 'package:e_commerce_admin/core/functions/loading.dart';
import 'package:e_commerce_admin/core/functions/status_update.dart';
import 'package:e_commerce_admin/data/datasource/remote/auth/verifycode_data.dart';
import 'package:e_commerce_admin/routes.dart';
import 'package:e_commerce_admin/view/screens/auth/forgot_pass/reset_pass.dart';
import 'package:e_commerce_admin/view/screens/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCon extends GetxController {
  final GlobalKey<FormState> fst = GlobalKey<FormState>();
  late RequsetStatus requsetStatus;
  int code = 0;
  String email = '';
  VerifyCodeData verifyCodeData = VerifyCodeData(crud: Get.find());

  verifyCode(
      {required String passedEmail,
      required String passedCode,
      required bool resetPass}) async {
    code = int.parse(passedCode);
    email = passedEmail;
    bool verified = await getData();
    if (verified) {
      if (resetPass) {
        goToReset();
      } else {
        goToSuccess();
      }
    }
  }

  Future<bool> getData() async {
    late bool res;
    requsetStatus = RequsetStatus.loading;
    loading();
    var response =
        await verifyCodeData.getData(email: email, code: code.toString());
    Get.back();
    requsetStatus = statusUpdater(response: response);
    if (requsetStatus == RequsetStatus.success) {
      if (response['status'] == 'success') {
        res = true;
      } else if (response['status'] == 'failure') {
        res = false;
        Get.defaultDialog(title: 'alert'.tr, middleText: 'wrongcode'.tr);
      }
    }
    return res;
  }

  goToReset() {
    Get.to(() => ResetPassword(email: email));
  }

  goToSuccess() {
    Get.offAll(
      () =>
      const SuccessScreen(
        toNamed: AppRoutes.login,
        buttonText: 'login_title_0',
      ),
    );
  }
}
