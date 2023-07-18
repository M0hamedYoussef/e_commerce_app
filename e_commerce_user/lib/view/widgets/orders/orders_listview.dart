import 'package:e_commerce/controller/orders/orders_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/view/widgets/orders/orders_items_list.dart';
import 'package:e_commerce/view/widgets/orders/orders_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersItemsListView extends StatelessWidget {
  const OrdersItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: GetBuilder<OrdersCon>(
          builder: (controller) {
            return Column(
              children: [
                if (!controller.inArchive && !controller.inDelivery)
                  InkWell(
                    onTap: () {
                      controller.goToInDelivery();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'indelivery'.tr,
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
                const OrdersList(),
                if (controller.myServices.ordersList.isNotEmpty &&
                    !controller.inArchive)
                  const OrdersPrice(),
              ],
            );
          },
        ),
      ),
    );
  }
}
