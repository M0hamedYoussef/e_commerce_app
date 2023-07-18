import 'package:e_commerce/controller/orders/orders_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OrderItemInfo extends GetView<OrdersCon> {
  const OrderItemInfo({
    super.key,
    required this.lang,
    required this.index,
  });
  final String lang;
  final int index;

  @override
  Widget build(BuildContext context) {
    ItemsModel orderModel = ItemsModel.fromJson(
      controller.myServices.ordersList[index],
    );
    AddressModel addressModel = AddressModel.fromJson(
      controller.myServices.ordersList[index],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: orderModel.orderStatus == 'pending'
              ? const EdgeInsets.all(0)
              : orderModel.orderStatus == 'done'
                  ? const EdgeInsets.only(top: 12, bottom: 12)
                  : orderModel.orderStatus == 'out for delivery'
                      ? const EdgeInsets.only(top: 0, bottom: 0)
                      : const EdgeInsets.only(top: 17, bottom: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${'order_status'.tr} : ${orderModel.orderStatus.toString().tr}',
                style: TextStyle(
                  color: orderModel.orderStatus == 'canceled'
                      ? AppColors.red
                      : orderModel.orderStatus == 'done'
                          ? AppColors.green
                          : AppColors.blue,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                  height: 0.4,
                  fontSize: 17,
                ),
              ),
              if (orderModel.orderStatus == 'pending')
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                      controller.deleteOrder(orderModel: orderModel);
                    },
                    icon: const Icon(Icons.cancel),
                    visualDensity: VisualDensity.lerp(
                      VisualDensity.compact,
                      VisualDensity.compact,
                      VisualDensity.minimumDensity,
                    ),
                  ),
                ),
              if (orderModel.orderStatus == 'out for delivery')
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                      controller.goToMap(orderModel: orderModel);
                    },
                    icon: const Icon(Icons.gps_fixed_outlined),
                    visualDensity: VisualDensity.lerp(
                      VisualDensity.compact,
                      VisualDensity.compact,
                      VisualDensity.minimumDensity,
                    ),
                  ),
                ),
              if (orderModel.orderStatus == 'done')
                RatingBar.builder(
                  initialRating: orderModel.orderRate ?? 0,
                  minRating: 0.5,
                  direction: Axis.horizontal,
                  updateOnDrag: false,
                  allowHalfRating: true,
                  glow: true,
                  itemSize: 20,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: AppColors.blue,
                  ),
                  onRatingUpdate: (rating) async {
                    await controller.rateOrder(
                      orderId: orderModel.orderId.toString(),
                      orderRate: rating.toString(),
                    );
                  },
                ),
            ],
          ),
        ),
        Text(
          '${'order.no'.tr} #$index',
          style: const TextStyle(
            color: AppColors.grey,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            height: 1,
            fontSize: 20,
          ),
        ),
        Text(
          lang == 'ar'
              ? '${'productname'.tr} : ${orderModel.itemNameAr}'
              : '${'productname'.tr} : ${orderModel.itemNameEn}',
          style: const TextStyle(
            color: AppColors.greyLight,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Text(
          '${'productcolor'.tr} : ${orderModel.cartItemcolor.toString().tr}',
          style: const TextStyle(
            color: AppColors.greyLight,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Text(
          '${'address'.tr} : ${addressModel.addressName}',
          style: const TextStyle(
            color: AppColors.greyLight,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${'productquantity'.tr} : ${orderModel.cartItemcount}',
              style: const TextStyle(
                color: AppColors.greyLight,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            Text(
              Jiffy(orderModel.orderDate).fromNow(),
              style: const TextStyle(
                color: AppColors.grey,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
