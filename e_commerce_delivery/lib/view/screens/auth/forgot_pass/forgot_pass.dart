import 'package:e_commerce_delivery/controller/auth/forgot_pass/forgotpass_con.dart';
import 'package:e_commerce_delivery/core/const/decoration.dart';
import 'package:e_commerce_delivery/view/widgets/auth/global/app_bar.dart';
import 'package:e_commerce_delivery/view/widgets/auth/global/body/custom_listview.dart';
import 'package:e_commerce_delivery/view/widgets/auth/global/body/title.dart';
import 'package:e_commerce_delivery/view/widgets/auth/global/buttons/custom_button.dart';
import 'package:e_commerce_delivery/view/widgets/auth/global/forms/email_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPassCon forgotPassCon = Get.put(ForgotPassCon());

    return Scaffold(
      appBar: customAppBar(
        title: 'forgot'.tr,
      ),
      body: CustomListView(
        fst: forgotPassCon.fst,
        children: [
          const CustomTitle(title: 'forgot_title'),
          SizedBox(height: AppDecoration().screenHeight * .1),
          EmailForm(
            focusNode: forgotPassCon.fstEmailFocus,
            emailCon: forgotPassCon.emailCon,
            onEditingComplete: () {
              forgotPassCon.checkEmail();
            },
          ),
          SizedBox(height: AppDecoration().screenHeight * .02),
          GlobalCustomButton(
            text: 'send_code',
            onPressed: () {
              forgotPassCon.checkEmail();
            },
          ),
        ],
      ),
    );
  }
}
