import 'package:e_commerce/controller/orders/orders_con.dart';
import 'package:e_commerce/core/const/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class OrdersCustomHandling extends StatelessWidget {
  const OrdersCustomHandling({super.key, required this.itemBuilder});
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersCon>(
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
          if (controller.myServices.ordersList.isEmpty) {
            return Center(
              child: Lottie.asset(
                AppImageAsset.lottieEmpty,
                width: AppDecoration().screenWidth * .7,
                height: AppDecoration().screenHeight * .6,
                frameRate: FrameRate(90),
              ),
            );
          } else {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: controller.myServices.ordersList.length,
                  itemBuilder: itemBuilder,
                ),
              ),
            );
          }
        }
      },
    );
  }
}
