import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class DeliveryOrderShippingPrice extends StatelessWidget {
  const DeliveryOrderShippingPrice({super.key, required this.price});
  final double price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'shipping'.tr,
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
            Text(
              '$price',
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
