import 'package:e_commerce/controller/onboarding_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/localization/local_con.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotsOnBoarding extends GetView<OnBoardingCon> {
  const DotsOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    if (localeController.locale.toString().contains('ar')) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBoardingData.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  controller.dotsCon(index: index);
                },
                child: GetBuilder<OnBoardingCon>(
                  builder: (controller) => AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      color: controller.currentPageIndex == index
                          ? AppColors.blue
                          : AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(right: 4),
                    width: controller.currentPageIndex == index ? 15 : 6,
                    height: 6,
                  ),
                ),
              );
            },
          )
        ],
      );
    } else if (localeController.locale.toString().contains('en')) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBoardingData.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  controller.dotsCon(index: index);
                },
                child: GetBuilder<OnBoardingCon>(
                  builder: (controller) => AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      color: controller.currentPageIndex == index
                          ? AppColors.blue
                          : AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(right: 4),
                    width: controller.currentPageIndex == index ? 15 : 6,
                    height: 6,
                  ),
                ),
              );
            },
          )
        ],
      );
    }
    return const Text('');
  }
}
