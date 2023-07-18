import 'package:e_commerce_admin/controller/admin/orders_con.dart';
import 'package:e_commerce_admin/core/const/colors.dart';
import 'package:e_commerce_admin/core/const/decoration.dart';
import 'package:e_commerce_admin/data/model/orders/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderItemPrice extends GetView<OrdersCon> {
  const OrderItemPrice({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'price'.tr,
          style: const TextStyle(
            color: AppColors.grey,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            height: 1.5,
            fontSize: 20,
          ),
        ),
        const Spacer(),
        const Text(
          'EGP ',
          style: TextStyle(
            color: AppColors.grey,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            height: 1.5,
            fontSize: 15,
          ),
        ),
        Text(
          NumberFormat('#,###').format(orderModel.itemPrice!),
          style: const TextStyle(
            color: AppColors.grey,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            height: 1.5,
            fontSize: 20,
          ),
        ),
        SizedBox(width: AppDecoration().screenWidth * .04),
      ],
    );
  }
}
