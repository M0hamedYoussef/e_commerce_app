import 'package:e_commerce_admin/controller/admin/orders_con.dart';
import 'package:e_commerce_admin/core/const/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_admin/core/const/decoration.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class OrdersCustomHandling extends GetView<OrdersCon> {
  const OrdersCustomHandling({super.key, required this.itemBuilder});
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersCon>(
      builder: (con) {
        if (con.loading == true) {
          return Center(
            child: Lottie.asset(
              AppImageAsset.lottieLoading,
              width: AppDecoration().screenWidth * .7,
              height: AppDecoration().screenHeight * .6,
              frameRate: FrameRate(90),
            ),
          );
        } else {
          if (controller.ordersList.isEmpty) {
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
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: controller.ordersList.length,
                itemBuilder: itemBuilder,
              ),
            );
          }
        }
      },
    );
  }
}
