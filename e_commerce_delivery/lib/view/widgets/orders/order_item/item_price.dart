import 'package:e_commerce_delivery/controller/orders_con.dart';
import 'package:e_commerce_delivery/core/const/colors.dart';
import 'package:e_commerce_delivery/core/const/decoration.dart';
import 'package:e_commerce_delivery/data/model/order_model.dart';
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
          NumberFormat('#,###').format(orderModel.orderPrice!),
          style: const TextStyle(
            color: AppColors.grey,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            height: 1.5,
            fontSize: 20,
          ),
        ),
        SizedBox(width: AppDecoration().screenWidth * .04),
        if (!controller.acceptedScreen)
          MaterialButton(
            onPressed: () {
              controller.acceptOrder(orderModel: orderModel);
            },
            color: AppColors.blue,
            textColor: AppColors.white,
            child: Text('get_order'.tr),
          ),
        if (controller.acceptedScreen)
          MaterialButton(
            onPressed: () {
              controller.goToOrderDetails(orderModel: orderModel);
            },
            color: AppColors.blue,
            textColor: AppColors.white,
            child: Text('details'.tr),
          ),
      ],
    );
  }
}
