import 'package:e_commerce_delivery/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'login_body_0'.tr,
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 15,
        fontFamily: 'Cairo',
      ),
      textAlign: TextAlign.center,
    );
  }
}
