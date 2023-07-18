import 'package:e_commerce/controller/items/item_details_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends GetView<ItemDetailsCon> {
  const ProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // String itemDesc = controller.lang == 'ar'
    //     ? controller.itemModel.itemDescAr!
    //     : controller.itemModel.itemDescEn!;

    String deliveryTime = controller.lang == 'ar'
        ? controller.deliveryTimeAr
        : controller.deliveryTimeEn;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Text(
        deliveryTime,
        style: const TextStyle(
          color: AppColors.grey,
          fontFamily: 'Cairo',
          fontSize: 17,
        ),
      ),
    );
  }
}
