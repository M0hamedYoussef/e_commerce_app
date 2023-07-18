import 'package:e_commerce/controller/orders/orders_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/view/widgets/orders/custom_handling.dart';
import 'package:e_commerce/view/widgets/orders/order_item/item_info.dart';
import 'package:e_commerce/view/widgets/orders/order_item/item_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersList extends GetView<OrdersCon> {
  const OrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return OrdersCustomHandling(
      itemBuilder: (context, index) {
        ItemsModel orderModel = ItemsModel.fromJson(
          controller.myServices.ordersList[index],
        );

        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                width: 0.1,
                color: AppColors.black,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OrderItemInfo(
                  lang: controller.lang,
                  index: index,
                ),
                const Divider(
                  thickness: 2,
                  color: AppColors.greyLight,
                ),
                OrderItemPrice(
                  orderModel: orderModel,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
