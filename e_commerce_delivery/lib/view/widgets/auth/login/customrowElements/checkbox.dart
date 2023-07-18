import 'package:e_commerce_delivery/controller/auth/login_con.dart';
import 'package:e_commerce_delivery/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginCheckBox extends GetView<LoginCon> {
  const LoginCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.changeCheckBox();
      },
      child: Row(
        children: [
          GetBuilder<LoginCon>(
            builder: (con) => Checkbox(
              value: con.checkbox,
              onChanged: (value) {
                con.changeCheckBox();
              },
            ),
          ),
          Text(
            'remember'.tr,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 15,
              fontFamily: 'Cairo',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
