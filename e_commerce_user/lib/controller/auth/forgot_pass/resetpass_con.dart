import 'package:e_commerce/core/class/request_status.dart';
import 'package:e_commerce/core/functions/loading.dart';
import 'package:e_commerce/core/functions/status_update.dart';
import 'package:e_commerce/data/datasource/remote/auth/forgot_pass/reset_pass_data.dart';
import 'package:e_commerce/routes.dart';
import 'package:e_commerce/view/screens/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassCon extends GetxController {
  final GlobalKey<FormState> fst = GlobalKey<FormState>();
  final FocusNode fstNewPassFocus = FocusNode();
  TextEditingController newPassCon = TextEditingController();
  final FocusNode fstReNewPassFocus = FocusNode();
  TextEditingController reNewPassCon = TextEditingController();
  late RequsetStatus requsetStatus;
  ResetPassData resetPassData = ResetPassData(crud: Get.find());

  bool passeye = true;
  changeobsc() {
    passeye = !passeye;
    update();
  }

  getToSuccessScreen({required String toNamed}) {
    Get.offAll(
      SuccessScreen(
        toNamed: toNamed,
        buttonText: 'login_title_0',
      ),
    );
  }

  reset({required String email}) async {
    if (fst.currentState!.validate()) {
      requsetStatus = RequsetStatus.loading;
      loading();
      var response = await resetPassData.giveData(
        email: email,
        password: reNewPassCon.text,
      );
      Get.back();
      requsetStatus = statusUpdater(response: response);
      if (requsetStatus == RequsetStatus.success) {
        if (response['status'] == 'success') {
          getToSuccessScreen(toNamed: AppRoutes.login);
        } else if (response['status'] == 'failure') {
          Get.defaultDialog(
            title: 'alert'.tr,
            middleText: 'oldPassword'.tr,
          );
        }
      } else if (response['status'] == 'not exists') {
        Get.defaultDialog(
          title: 'alert'.tr,
          middleText: 'alreadyExists'.tr,
        );
      }
    }
  }
}
