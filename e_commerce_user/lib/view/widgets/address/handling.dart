import 'package:e_commerce/controller/address/address_con.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/core/const/image_asset.dart';
import 'package:e_commerce/routes.dart';
import 'package:e_commerce/view/widgets/auth/global/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AddressScreenHandling extends StatelessWidget {
  const AddressScreenHandling({super.key, required this.itemBuilder});
  final Widget Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'addresses',
        addButton: true,
        addButtonOnPressed: () {
          Get.toNamed(AppRoutes.addressAdd);
        },
      ),
      body: GetBuilder<AddressCon>(
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
              itemCount: controller.addressesList.length,
              itemBuilder: itemBuilder,
            );
          }
        },
      ),
    );
  }
}
