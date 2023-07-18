import 'package:e_commerce/controller/auth/login_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DontHaveAccButton extends GetView<LoginCon> {
  const DontHaveAccButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Row(
        children: [
          Text(
            'donthaveacc'.tr,
            style: const TextStyle(
              color: AppColors.grey,
            ),
          ),
          const SizedBox(width: 7),
          GestureDetector(
            onTap: () {
              controller.toSignUp();
            },
            child: Text(
              'signup'.tr,
              style: const TextStyle(
                decoration: TextDecoration.underline,
                color: AppColors.blue,
                fontWeight: FontWeight.w700,
                decorationThickness: 1.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
