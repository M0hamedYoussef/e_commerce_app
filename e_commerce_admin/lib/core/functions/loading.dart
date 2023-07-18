import 'package:e_commerce_admin/core/const/decoration.dart';
import 'package:e_commerce_admin/core/const/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

loading() {
return Get.defaultDialog(
    title: '',
    middleText: '',
    backgroundColor: Colors.transparent,
    content: Lottie.asset(
      AppImageAsset.lottieLoading,
      width: AppDecoration().screenWidth * .4,
      frameRate: FrameRate(90),
    ),
  );
}
