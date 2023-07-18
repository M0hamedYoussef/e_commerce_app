import 'package:e_commerce/controller/orders/indelivery/delivery_orders_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/view/widgets/orders_delivery/custom_handling.dart';
import 'package:e_commerce/view/widgets/orders_delivery/order_item/item_info.dart';
import 'package:e_commerce/view/widgets/orders_delivery/order_item/item_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryOrdersList extends GetView<DeliveryOrdersCon> {
  const DeliveryOrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return OrdersDeliveryCustomHandling(
      itemBuilder: (context, index) {
        ItemsModel orderModel = ItemsModel.fromJson(
          controller.ordersList[index],
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
                DeliveryOrderItemInfo(
                  lang: controller.lang,
                  index: index,
                ),
                const Divider(
                  thickness: 2,
                  color: AppColors.greyLight,
                ),
                DeliveryOrderItemPrice(
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
