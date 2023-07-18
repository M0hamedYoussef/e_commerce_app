import 'package:e_commerce/controller/auth/sign_up/verify_signup_con.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/view/widgets/auth/global/app_bar.dart';
import 'package:e_commerce/view/widgets/auth/global/body/custom_listview.dart';
import 'package:e_commerce/view/widgets/auth/global/body/title.dart';
import 'package:e_commerce/view/widgets/auth/singup/forms/otp_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpVerifyScreen extends StatelessWidget {
  const SignUpVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpVerifyCon signUpVerifyCon = Get.put(SignUpVerifyCon());
    
    return Scaffold(
      appBar: customAppBar(title: 'verify_appbar'),
      body: CustomListView(
        fst: signUpVerifyCon.fst,
        children: [
          const CustomTitle(title: 'verify_title'),
          SizedBox(height: AppDecoration().screenHeight * .1),
          const SignUpVerifyOtpForm(),
          SizedBox(height: AppDecoration().screenHeight * .1),
        ],
      ),
    );
  }
}
