import 'package:e_commerce/controller/orders/indelivery/delivery_orders_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/view/widgets/orders_delivery/orders_items_list.dart';
import 'package:e_commerce/view/widgets/orders_delivery/orders_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryOrdersListView extends StatelessWidget {
  const DeliveryOrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: GetBuilder<DeliveryOrdersCon>(
          builder: (controller) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    ItemsModel orderModel =
                        ItemsModel.fromJson(controller.ordersInDeliveryList[0]);
                    controller.goToMap(orderModel: orderModel);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'map'.tr,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_right_alt_outlined,
                          color: AppColors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                const DeliveryOrdersList(),
                if (controller.ordersList.isNotEmpty)
                  const DeliveryOrdersPrice(),
              ],
            );
          },
        ),
      ),
    );
  }
}
