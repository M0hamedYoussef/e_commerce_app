import 'package:e_commerce/controller/onboarding_con.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/view/widgets/firstscreens/onboarding/custombutton.dart';
import 'package:e_commerce/view/widgets/firstscreens/onboarding/dots.dart';
import 'package:e_commerce/view/widgets/firstscreens/onboarding/pagebuilder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingCon());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: CustomPageBuilder(),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: AppDecoration().screenHeight * .02,
                  ),
                  const DotsOnBoarding(),
                  SizedBox(
                    height: AppDecoration().screenHeight * .08,
                  ),
                  const CustomButtonOnBoarding(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
