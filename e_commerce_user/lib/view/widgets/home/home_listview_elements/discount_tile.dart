import 'package:e_commerce/controller/home/home_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/core/const/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DiscountTile extends GetView<HomeCon> {
  const DiscountTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Stack(
        children: [
          Container(
            height: AppDecoration().screenHeight * 0.23,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(30),
          ),
          if (controller.lang == 'ar')
            Positioned(
              left: -30,
              child: SizedBox(
                height: AppDecoration().screenHeight * 0.23,
                child: Lottie.asset(
                  AppImageAsset.lottieDiscount,
                  frameRate: FrameRate(
                    90,
                  ),
                ),
              ),
            ),
          Container(
            width: AppDecoration().screenWidth * 0.7,
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
            child: Text(
              controller.lang == 'ar'
                  ? controller.texts[0].textAr!
                  : controller.texts[0].textEn!,
              style: const TextStyle(
                color: AppColors.white,
                fontFamily: 'Cairo',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textDirection: controller.lang == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              textAlign: TextAlign.justify,
            ),
          ),
          if (controller.lang == 'en')
            Positioned(
              right: -30,
              child: SizedBox(
                height: AppDecoration().screenHeight * 0.23,
                child: Lottie.asset(
                  AppImageAsset.lottieDiscount,
                  frameRate: FrameRate(
                    90,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
