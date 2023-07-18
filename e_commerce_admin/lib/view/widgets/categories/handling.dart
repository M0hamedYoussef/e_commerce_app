import 'package:e_commerce_admin/controller/admin/categories_con.dart';
import 'package:e_commerce_admin/core/const/decoration.dart';
import 'package:e_commerce_admin/core/const/image_asset.dart';
import 'package:e_commerce_admin/routes.dart';
import 'package:e_commerce_admin/view/widgets/auth/global/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CategorieScreenHandling extends StatelessWidget {
  const CategorieScreenHandling({super.key, required this.itemBuilder});
  final Widget Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'categories_title',
        addButton: true,
        addButtonOnPressed: () {
          Get.toNamed(AppRoutes.addCategorie);
        },
      ),
      body: GetBuilder<CategoriesCon>(
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
              itemCount: controller.categoriesList.length,
              itemBuilder: itemBuilder,
            );
          }
        },
      ),
    );
  }
}
