import 'package:e_commerce/controller/onboarding_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingCon> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.blue,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            controller.nextPage();
          },
          child: GetBuilder<OnBoardingCon>(
            builder: (controller) => Text(
              controller.currentPageIndex == 0 ? 'letsgo'.tr : 'continue'.tr,
              style: const TextStyle(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
