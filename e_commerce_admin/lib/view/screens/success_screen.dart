import 'package:e_commerce_admin/controller/global/success_screen_con.dart';
import 'package:e_commerce_admin/core/const/decoration.dart';
import 'package:e_commerce_admin/core/const/image_asset.dart';
import 'package:e_commerce_admin/view/widgets/auth/global/app_bar.dart';
import 'package:e_commerce_admin/view/widgets/auth/global/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key, required this.toNamed, required this.buttonText});
  final String toNamed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    SuccessScreenCon successScreenCon = Get.put(SuccessScreenCon());
    return Scaffold(
      appBar: customAppBar(
        title: 'success',
        backButton: false,
      ),
      body: WillPopScope(
        onWillPop: () {
          Get.back();
          return Future.value(false);
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Center(
                      child: Lottie.asset(
                        AppImageAsset.lottieCheck,
                        width: AppDecoration().screenWidth * .8,
                        frameRate: FrameRate(90),
                      ),
                    ),
                    const Spacer(),
                    GlobalCustomButton(
                      text: buttonText,
                      onPressed: () {
                        successScreenCon.toNamedFun(toNamed: toNamed);
                      },
                    ),
                    SizedBox(
                      height: AppDecoration().screenHeight * .02,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
