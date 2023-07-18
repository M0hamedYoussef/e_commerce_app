import 'package:e_commerce/controller/items/items_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsCategoriesList extends GetView<ItemsCon> {
  const ItemsCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 13, 0, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        height: AppDecoration().screenHeight * .038,
        width: AppDecoration().screenWidth,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              width: AppDecoration().screenWidth * .04,
            );
          },
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                controller.changeCat(index: index);
              },
              child: GetBuilder<ItemsCon>(
                builder: (controller) => Container(
                  decoration: controller.selectedCat ==
                          controller.categories[index]
                              ['categorie_name_${controller.lang}']
                      ? const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 3, color: AppColors.blue),
                          ),
                        )
                      : null,
                  child: Text(
                    controller.categories[index]
                        ['categorie_name_${controller.lang}'],
                    style: const TextStyle(color: AppColors.black),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
