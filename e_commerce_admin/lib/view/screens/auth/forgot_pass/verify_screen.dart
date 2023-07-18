import 'package:e_commerce_admin/controller/auth/forgot_pass/verify_con.dart';
import 'package:e_commerce_admin/core/const/decoration.dart';
import 'package:e_commerce_admin/view/widgets/auth/forgot_pass/verify_screen/otp_form.dart';
import 'package:e_commerce_admin/view/widgets/auth/global/app_bar.dart';
import 'package:e_commerce_admin/view/widgets/auth/global/body/custom_listview.dart';
import 'package:e_commerce_admin/view/widgets/auth/global/body/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key, this.email = '', this.resetPass = false});
  final String email;
  final bool resetPass;

  @override
  Widget build(BuildContext context) {
    VerifyCon verifyCon = Get.put(VerifyCon());

    return Scaffold(
      appBar: customAppBar(title: 'verify_appbar'),
      body: CustomListView(
        fst: verifyCon.fst,
        children: [
          const CustomTitle(title: 'verify_title'),
          SizedBox(height: AppDecoration().screenHeight * .1),
          VerifyOtpForm(
            resetPass: resetPass,
            email: email,
          ),
          SizedBox(height: AppDecoration().screenHeight * .1),
        ],
      ),
    );
  }
}
