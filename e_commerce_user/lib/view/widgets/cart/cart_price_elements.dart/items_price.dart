import 'package:e_commerce/controller/cart/cart_controller.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartItemsPrice extends StatelessWidget {
  const CartItemsPrice({super.key});
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
            GetBuilder<CartCon>(
              builder: (controller) {
                return Column(
                  children: [
                    if (controller.priceWithDiscount != controller.price)
                      Text(
                        NumberFormat('#,###').format(controller.price),
                        style: const TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          height: 0.1,
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.grey,
                        ),
                      ),
                    Text(
                      NumberFormat('#,###')
                          .format(controller.priceWithDiscount),
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.grey,
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
