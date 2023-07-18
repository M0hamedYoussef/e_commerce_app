import 'package:e_commerce_admin/controller/admin/orders_con.dart';
import 'package:e_commerce_admin/core/const/colors.dart';
import 'package:e_commerce_admin/data/model/orders/order_model.dart';
import 'package:e_commerce_admin/view/widgets/orders/custom_handling.dart';
import 'package:e_commerce_admin/view/widgets/orders/order_item/item_info.dart';
import 'package:e_commerce_admin/view/widgets/orders/order_item/item_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersList extends GetView<OrdersCon> {
  const OrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return OrdersCustomHandling(
      itemBuilder: (context, index) {
        OrderModel orderModel = OrderModel.fromJson(
          controller.ordersList[index],
        );

        return Padding(
          padding: const EdgeInsets.only(
            right: 10,
            left: 10,
            bottom: 8.0,
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                width: 0.1,
                color: AppColors.black,
              ),
            ),
            child: Flex(
              direction: Axis.vertical,
              children: [
                OrderItemInfo(
                  button: controller.pageButton,
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
