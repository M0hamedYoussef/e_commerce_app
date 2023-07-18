import 'package:e_commerce_delivery/controller/auth/forgot_pass/resetpass_con.dart';
import 'package:e_commerce_delivery/controller/global/global_icon_con.dart';
import 'package:e_commerce_delivery/core/const/decoration.dart';
import 'package:e_commerce_delivery/core/functions/passeye_lock.dart';
import 'package:e_commerce_delivery/view/widgets/auth/forgot_pass/reset_password/re_enter_pass_form.dart';
import 'package:e_commerce_delivery/view/widgets/auth/global/body/custom_listview.dart';
import 'package:e_commerce_delivery/view/widgets/auth/global/app_bar.dart';
import 'package:e_commerce_delivery/view/widgets/auth/global/buttons/custom_button.dart';
import 'package:e_commerce_delivery/view/widgets/auth/global/forms/pass_form.dart';
import 'package:e_commerce_delivery/view/widgets/auth/global/body/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, this.email = ''});
  final String email;
  @override
  Widget build(BuildContext context) {
    ResetPassCon resetPassCon = Get.put(ResetPassCon());
GlobalIconCon globalIconCon = Get.put(GlobalIconCon());
    return Scaffold(
      appBar: customAppBar(
        title: 'reset_appBar',
        back: false,
        onPressed: () {
          passEYE();
        },
      ),
      body: WillPopScope(
        onWillPop: passEYE,
        child: CustomListView(
          fst: resetPassCon.fst,
          children: [
            const CustomTitle(title: 'reset_title'),
            SizedBox(height: AppDecoration().screenHeight * .08),
            PassForm(
              focusNode: resetPassCon.fstNewPassFocus,
              passCon: resetPassCon.newPassCon,
              nextNode: resetPassCon.fstReNewPassFocus,
              onPressed: () {
                globalIconCon.changeobsc();
              },
            ),
            SizedBox(height: AppDecoration().screenHeight * .01),
            RePassForm(
              focusNode: resetPassCon.fstReNewPassFocus,
              rePassCon: resetPassCon.reNewPassCon,
              passCon: resetPassCon.newPassCon,
              onEditingComplete: () {
                resetPassCon.reset(email : email);
              },
              onPressed: () {
                resetPassCon.changeobsc();
              },
            ),
            SizedBox(height: AppDecoration().screenHeight * .05),
            GlobalCustomButton(
              text: 'reset_button',
              onPressed: () {
                resetPassCon.reset(email : email);
              },
            ),
          ],
        ),
      ),
    );
  }
}
