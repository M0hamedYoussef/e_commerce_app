import 'package:e_commerce/controller/auth/sign_up/signup_con.dart';
import 'package:e_commerce/controller/auth/sign_up/verify_signup_con.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class SignUpVerifyOtpForm extends GetView<SignUpVerifyCon> {
  const SignUpVerifyOtpForm({super.key});
  @override
  Widget build(BuildContext context) {
    SignUpCon signUpCon = Get.put(SignUpCon());
    return OtpTextField(
      numberOfFields: 5,
      autoFocus: true,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      onSubmit: (code) {
        controller.verifyCode(
          passedEmail: signUpCon.emailCon.text,
          passedCode: code,
        );
      },
      showFieldAsBox: true,
    );
  }
}
