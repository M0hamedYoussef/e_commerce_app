import 'package:e_commerce/controller/orders/indelivery/delivery_orders_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DeliveryOrderItemPrice extends GetView<DeliveryOrdersCon> {
  const DeliveryOrderItemPrice({super.key, required this.orderModel});
  final ItemsModel orderModel;

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
          NumberFormat('#,###').format(orderModel.priceWithDiscount!),
          style: const TextStyle(
            color: AppColors.grey,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            height: 1.5,
            fontSize: 20,
          ),
        ),
        SizedBox(width: AppDecoration().screenWidth * 0.01),
        if (orderModel.itemPrice != orderModel.priceWithDiscount)
          Text(
            NumberFormat('#,###').format(orderModel.itemPrice!),
            style: const TextStyle(
              color: AppColors.grey,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
              height: 1.5,
              decoration: TextDecoration.lineThrough,
              fontSize: 15,
            ),
          ),
        SizedBox(width: AppDecoration().screenWidth * .04),
        MaterialButton(
          onPressed: () {
            controller.goToDetails(itemsModel: orderModel);
          },
          color: AppColors.blue,
          textColor: AppColors.white,
          child: Text('show_item'.tr),
        ),
      ],
    );
  }
}
