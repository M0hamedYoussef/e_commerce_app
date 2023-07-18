import 'package:e_commerce/controller/orders/orders_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/view/widgets/orders/order_price_elements.dart/order_items_price.dart';
import 'package:e_commerce/view/widgets/orders/order_price_elements.dart/shipping_price.dart';
import 'package:e_commerce/view/widgets/orders/order_price_elements.dart/total_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPrice extends StatelessWidget {
  const OrdersPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersCon>(
      builder: (controller) {
        if (controller.loading == false && controller.price != 0) {
          return Container(
            padding: const EdgeInsets.fromLTRB(27, 0, 27, 8),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.greyLight,
                  width: 0.9,
                ),
              ),
            ),
            child: Column(
              children: const [
                OrderItemsPrice(),
                OrderShippingPrice(price: 200),
                Divider(thickness: 1.8),
                OrderTotalPrice()
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
