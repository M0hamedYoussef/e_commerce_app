import 'package:e_commerce/controller/global/search_bar_con.dart';
import 'package:e_commerce/core/const/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class SearchBarCustomHandling extends GetView<SearchBarCon> {
  const SearchBarCustomHandling({super.key, required this.itemBuilder});
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    if (controller.loading == true) {
      return Center(
        child: Lottie.asset(
          AppImageAsset.lottieLoading,
          width: AppDecoration().screenWidth * .7,
          height: AppDecoration().screenHeight * .6,
          frameRate: FrameRate(90),
        ),
      );
    } else {
      if (controller.searchResult.isEmpty) {
        return Center(
          child: Lottie.asset(
            AppImageAsset.lottieEmpty,
            width: AppDecoration().screenWidth * .7,
            height: AppDecoration().screenHeight * .65,
            frameRate: FrameRate(90),
          ),
        );
      } else {
        return GridView.builder(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.69,
          ),
          itemCount: controller.searchResult.length,
          itemBuilder: itemBuilder,
        );
      }
    }
  }
}
