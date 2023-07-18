import 'package:e_commerce/core/services/my_services.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:e_commerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnBoardingCon extends GetxController {
  MyServices myServices = Get.find();

  int currentPageIndex = 0;
  PageController pageController = PageController();

  onPageChanged({required int index}) {
    currentPageIndex = index;
    update();
  }

  nextPage() async {
    if (currentPageIndex != onBoardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    } else if (currentPageIndex == onBoardingData.length - 1) {
      Get.offAllNamed(AppRoutes.login);
      await myServices.sharedPreferences.setBool('OnboardingSkip', true);
    }
  }

  dotsCon({required index}) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
    update();
  }
}
