import 'package:e_commerce/controller/cart/cart_controller.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemOptions extends GetView<CartCon> {
  const CartItemOptions({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    ItemsModel itemsModel = ItemsModel.fromJson(controller.myServices.cartItems[index]);
    int itemCount = itemsModel.cartItemcount!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (itemsModel.itemCount! >
                    controller.myServices.cartItems[index]['cart_itemcount']) {
                  controller.myServices.cartItems[index]['cart_itemcount'] =
                      controller.myServices.cartItems[index]['cart_itemcount'] + 1;
                  itemsModel.cartItemcount =
                      controller.myServices.cartItems[index]['cart_itemcount'];
                  controller.updateItemCount(
                    itemModel: itemsModel,
                  );
                }
              },
              icon: const Icon(
                Icons.add,
                size: 27,
              ),
              splashRadius: 15,
            ),
            Text('$itemCount'),
            IconButton(
              onPressed: () {
                if (itemsModel.cartItemcount != 1) {
                  controller.myServices.cartItems[index]['cart_itemcount'] =
                      controller.myServices.cartItems[index]['cart_itemcount'] - 1;
                  itemsModel.cartItemcount =
                      controller.myServices.cartItems[index]['cart_itemcount'];
                  controller.updateItemCount(
                    itemModel: itemsModel,
                  );
                }
              },
              icon: const Icon(
                Icons.remove,
                size: 27,
              ),
              splashRadius: 15,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          child: IconButton(
            onPressed: () {
              controller.removeFromCart(
                itemsModel: itemsModel,
              );
            },
            icon: const Icon(
              Icons.delete,
              size: 27,
            ),
            splashRadius: 15,
          ),
        ),
      ],
    );
  }
}
