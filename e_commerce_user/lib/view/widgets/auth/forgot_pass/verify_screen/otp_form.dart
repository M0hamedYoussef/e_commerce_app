import 'package:e_commerce/controller/auth/forgot_pass/verify_con.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyOtpForm extends GetView<VerifyCon> {
  const VerifyOtpForm(
      {required this.email, required this.resetPass, super.key});

  final String email;
  final bool resetPass;

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 5,
      autoFocus: true,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      onSubmit: (code) {
        controller.verifyCode(
          passedEmail: email,
          passedCode: code,
          resetPass: resetPass,
        );
      },
      showFieldAsBox: true,
    );
  }
}
