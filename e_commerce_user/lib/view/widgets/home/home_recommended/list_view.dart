import 'package:e_commerce/controller/home/home_con.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/view/widgets/home/home_recommended/item_image.dart';
import 'package:e_commerce/view/widgets/home/home_recommended/item_image_bg.dart';
import 'package:e_commerce/view/widgets/home/home_recommended/item_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeRecommendedListView extends GetView<HomeCon> {
  const HomeRecommendedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 0, 13, 0),
      child: SizedBox(
        height: AppDecoration().screenHeight * .2,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              width: AppDecoration().screenWidth * .04,
            );
          },
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            if (controller.items[index] != "No Data") {
              ItemsModel itemsModel =
                  ItemsModel.fromJson(controller.items[index]);
              return GestureDetector(
                onTap: () {
                  controller.goToProductScreen(
                    itemsModel: itemsModel,
                  );
                },
                child: Stack(
                  children: [
                    HomeRecommendedItemImage(
                      itemsModel: itemsModel,
                    ),
                    const HomeRecommendedImageBG(),
                    HomeRecommendedItemName(
                      index: index,
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
