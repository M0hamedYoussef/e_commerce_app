import 'package:e_commerce/controller/cart/cart_controller.dart';
import 'package:e_commerce/controller/items/item_details_con.dart';
import 'package:e_commerce/view/widgets/items/item_details/item_details_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsCon itemDetailsCon = Get.put(ItemDetailsCon());
    CartCon cartCon = Get.put(CartCon());

    return Scaffold(
      body: const ItemDetailsListView(),
      floatingActionButton: itemDetailsCon.itemModel.itemActive == 1 ? GetBuilder<ItemDetailsCon>(
        builder: (controller) {
          if (controller.loading == false && controller.colotArg == null) {
            return FloatingActionButton(
              heroTag: '',
              onPressed: () {
                itemDetailsCon.itemModel.selectedColor =
                    itemDetailsCon.selectedColor.value;
                itemDetailsCon.itemModel.cartItemcount = 1;
                cartCon.onPressed(
                  itemsModel: itemDetailsCon.itemModel,
                );
              },
              child: GetBuilder<CartCon>(
                builder: (controller) {
                  return cartCon.cartIcon(
                    itemsModel: itemDetailsCon.itemModel,
                  );
                },
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ) : null,
    );
  }
}
