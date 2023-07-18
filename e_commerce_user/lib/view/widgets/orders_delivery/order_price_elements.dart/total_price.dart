import 'package:e_commerce/controller/orders/indelivery/delivery_orders_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DeliveryOrderTotalPrice extends StatelessWidget {
  const DeliveryOrderTotalPrice({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'total'.tr,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.grey,
          ),
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'EGP ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppColors.grey,
                ),
              ),
            ),
            GetBuilder<DeliveryOrdersCon>(
              builder: (controller) {
                return Text(
                  NumberFormat('#,###').format(controller.totalPrice),
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.grey,
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
