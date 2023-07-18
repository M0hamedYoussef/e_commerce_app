import 'package:e_commerce/controller/favourites/favourites_con.dart';
import 'package:e_commerce/core/const/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class FavouritesCustomListView extends GetView<FavoritesCon> {
  const FavouritesCustomListView({super.key, required this.itemBuilder});
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    if (controller.loading) {
      return Center(
        child: Lottie.asset(
          AppImageAsset.lottieLoading,
          width: AppDecoration().screenWidth * .7,
          height: AppDecoration().screenHeight * .6,
          frameRate: FrameRate(90),
        ),
      );
    } else {
      if (controller.favourites.isEmpty) {
        return Center(
          child: Lottie.asset(
            AppImageAsset.lottieEmpty,
            width: AppDecoration().screenWidth * .7,
            height: AppDecoration().screenHeight * .6,
            frameRate: FrameRate(90),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.69,
            ),
            itemCount: controller.favourites.length,
            itemBuilder: itemBuilder,
          ),
        );
      }
    }
  }
}
