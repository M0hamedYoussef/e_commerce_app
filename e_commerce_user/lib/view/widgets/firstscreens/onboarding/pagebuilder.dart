import 'package:e_commerce/controller/onboarding_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPageBuilder extends GetView<OnBoardingCon> {
  const CustomPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (index) {
        controller.onPageChanged(index: index);
      },
      physics: const BouncingScrollPhysics(),
      controller: controller.pageController,
      itemCount: onBoardingData.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text(
              onBoardingData[index].title!.tr,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: AppDecoration().screenHeight * .12,
            ),
            Image.asset(
              onBoardingData[index].image!,
              width: AppDecoration().screenWidth * 02,
              height: AppDecoration().screenHeight * .29,
            ),
            SizedBox(
              height: AppDecoration().screenHeight * .12,
            ),
            Text(
              onBoardingData[index].body!.tr,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w700,
                color: AppColors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
