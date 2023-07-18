import 'package:e_commerce_admin/controller/admin/items_con.dart';
import 'package:e_commerce_admin/core/const/decoration.dart';
import 'package:e_commerce_admin/core/const/image_asset.dart';
import 'package:e_commerce_admin/view/widgets/auth/global/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ItemsScreenHandling extends StatelessWidget {
  const ItemsScreenHandling({super.key, required this.itemBuilder});
  final Widget Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsCon>(
      builder: (controller) => Scaffold(
        appBar: customAppBar(
          title: 'items_title',
          addButton: controller.loading == true ? false : true,
          addButtonOnPressed: () {
            controller.goToAddItem();
          },
        ),
        body: GetBuilder<ItemsCon>(
          builder: (controller) {
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
              return ListView.builder(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: controller.itemsList.length,
                itemBuilder: itemBuilder,
              );
            }
          },
        ),
      ),
    );
  }
}
