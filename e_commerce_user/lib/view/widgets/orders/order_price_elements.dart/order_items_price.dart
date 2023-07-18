import 'package:e_commerce/controller/orders/orders_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderItemsPrice extends StatelessWidget {
  const OrderItemsPrice({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'price'.tr,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: AppColors.grey,
          ),
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'EGP',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: AppColors.grey,
                ),
              ),
            ),
            GetBuilder<OrdersCon>(
              builder: (controller) {
                return Row(
                  children: [
                    Text(
                      NumberFormat('#,###')
                          .format(controller.priceWithDiscount),
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        height: 1.3,
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(width: 5),
                    if (controller.price != controller.priceWithDiscount)
                      Text(
                        NumberFormat('#,###').format(controller.price),
                        style: const TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.3,
                          color: AppColors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
