import 'package:e_commerce_delivery/controller/auth/login_con.dart';
import 'package:e_commerce_delivery/core/const/colors.dart';
import 'package:e_commerce_delivery/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForgotPass extends GetView<LoginCon> {
  const LoginForgotPass({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.forgotPass);
      },
      child: Text(
        'forgot'.tr,
        style: const TextStyle(
          decoration: TextDecoration.underline,
          color: AppColors.greyLight,
          fontWeight: FontWeight.w700,
          decorationThickness: 0.5,
        ),
      ),
    );
  }
}
