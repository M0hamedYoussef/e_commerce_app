import 'package:e_commerce/controller/cart/cart_controller.dart';
import 'package:e_commerce/view/widgets/auth/global/app_bar.dart';
import 'package:e_commerce/view/widgets/cart/custom_cart_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartCon cartCon = Get.put(CartCon());
    cartCon.getData();
    return Scaffold(
      appBar: customAppBar(title: 'cart_title'),
      body: const CartList(),
    );
  }
}
