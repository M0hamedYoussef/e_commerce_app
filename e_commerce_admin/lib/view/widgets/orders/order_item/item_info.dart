import 'package:e_commerce_admin/controller/admin/orders_con.dart';
import 'package:e_commerce_admin/core/const/colors.dart';
import 'package:e_commerce_admin/core/const/decoration.dart';
import 'package:e_commerce_admin/data/model/orders/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrderItemInfo extends GetView<OrdersCon> {
  const OrderItemInfo({
    super.key,
    required this.lang,
    required this.index,
    required this.button,
  });
  final int index;
  final String button;
  final String lang;

  @override
  Widget build(BuildContext context) {
    OrderModel orderModel = OrderModel.fromJson(
      controller.ordersList[index],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: AppDecoration().screenHeight * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${'order.no'.tr} #${orderModel.orderId}',
              style: const TextStyle(
                color: AppColors.grey,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                height: 0.4,
                fontSize: 20,
              ),
            ),
            Text(
              Jiffy(orderModel.orderCreateddate).fromNow(),
              style: const TextStyle(
                color: AppColors.grey,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                height: 0.3,
                fontSize: 17,
              ),
              textDirection: TextDirection.ltr,
            ),
          ],
        ),
        SizedBox(height: AppDecoration().screenHeight * 0.01),
        if (button == 'null')
          Text(
            '${'order_status'.tr} : ${(orderModel.orderStatus).toString().tr}',
            style: const TextStyle(
              color: AppColors.greyLight,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        Text(
          '${'address'.tr} : ${orderModel.addressName}',
          style: const TextStyle(
            color: AppColors.greyLight,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Text(
          '${'city'.tr} : ${orderModel.addressCity}',
          style: const TextStyle(
            color: AppColors.greyLight,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Text(
          '${'street'.tr} : ${orderModel.addressStreet}',
          style: const TextStyle(
            color: AppColors.greyLight,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Text(
          '${'phone'.tr} : ${orderModel.addressPhonenumber}',
          style: const TextStyle(
            color: AppColors.greyLight,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        if (button == 'null')
          SizedBox(height: AppDecoration().screenHeight * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${'paymentmethod'.tr} : ${orderModel.orderPaymentmethod}',
              style: const TextStyle(
                color: AppColors.greyLight,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                height: 0.5,
                fontSize: 17,
              ),
            ),
            if (button != 'null')
              MaterialButton(
                onPressed: () {
                  if (button == 'approve') {
                    controller.approveOrder(orderModel: orderModel);
                  } else if (button == 'startprepare') {
                    controller.startPrepareOrder(orderModel: orderModel);
                  } else if (button == 'prepared') {
                    controller.preparedOrder(orderModel: orderModel);
                  }
                },
                color: AppColors.blue,
                textColor: AppColors.white,
                child: Text(button.tr),
              ),
          ],
        ),
      ],
    );
  }
}
