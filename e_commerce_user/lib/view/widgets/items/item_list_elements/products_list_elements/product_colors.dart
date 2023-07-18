import 'package:e_commerce/controller/items/item_details_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/core/functions/get_color.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductColors extends StatelessWidget {
  const ProductColors({super.key, required this.itemModel});
  final ItemsModel itemModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDetailsCon>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ...List.generate(
                      itemModel.itemColors?.length == 1
                          ? 0
                          : itemModel.itemColors!.length,
                      (index) {
                        String? itemColor =
                            itemModel.itemColors?[index].toString().trim();
                        return GestureDetector(
                          onTap: () {
                            if (controller.colotArg == null) {
                              controller.onColorChanged(
                                givedColor: itemColor ?? 'default',
                                inCart: controller.checkInCart(
                                    itemModel: itemModel),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              height: controller.selectedColor.value ==
                                      itemColor
                                  ? (AppDecoration().screenHeight * .05) * 1.2
                                  : AppDecoration().screenHeight * .05,
                              width: controller.selectedColor.value == itemColor
                                  ? AppDecoration().screenWidth * .1
                                  : AppDecoration().screenWidth * .08,
                              decoration: BoxDecoration(
                                color: getColorFromString(
                                  itemColor ?? 'default',
                                ),
                                border: Border.all(
                                  color: controller.selectedColor.value ==
                                          itemColor
                                      ? AppColors.blue
                                      : AppColors.black.withOpacity(0.2),
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
