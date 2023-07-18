import 'package:e_commerce/controller/items/items_con.dart';
import 'package:e_commerce/core/const/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class ItemsCustomHandling extends GetView<ItemsCon> {
  const ItemsCustomHandling({super.key, required this.itemBuilder});
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    if (controller.items.isEmpty) {
      return Center(
        child: Lottie.asset(
          AppImageAsset.lottieEmpty,
          width: AppDecoration().screenWidth * .7,
          height: AppDecoration().screenHeight * .6,
          frameRate: FrameRate(90),
        ),
      );
    } else {
      return GetBuilder<ItemsCon>(
        builder: (con) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                shrinkWrap: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.69,
                ),
                itemCount: controller.items.length,
                itemBuilder: itemBuilder,
              ),
            ),
          );
        },
      );
    }
  }
}
