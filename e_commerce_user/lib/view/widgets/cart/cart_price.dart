import 'package:e_commerce/controller/cart/cart_controller.dart';
import 'package:e_commerce/view/widgets/cart/cart_price_elements.dart/items_price.dart';
import 'package:e_commerce/view/widgets/cart/cart_price_elements.dart/shipping_price.dart';
import 'package:e_commerce/view/widgets/cart/cart_price_elements.dart/total_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPrice extends GetView<CartCon> {
  const CartPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(27, 0, 27, 8),
      child: Column(
        children: const [
          CartItemsPrice(),
          CartShippingPrice(price: 200),
          Divider(thickness: 1.8),
          CartTotalPrice()
        ],
      ),
    );
  }
}
