import 'package:e_commerce/controller/cart/cart_controller.dart';
import 'package:e_commerce/controller/cart/checkout_controller.dart';
import 'package:e_commerce/view/widgets/auth/global/app_bar.dart';
import 'package:e_commerce/view/widgets/auth/global/buttons/custom_button.dart';
import 'package:e_commerce/view/widgets/cart/cart_price.dart';
import 'package:e_commerce/view/widgets/checkout/addresses_radio.dart';
import 'package:e_commerce/view/widgets/checkout/radio_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends GetView<CheckoutCon> {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutCon());
    CartCon cartCon = Get.put(CartCon());

    return Scaffold(
      appBar: customAppBar(title: 'checkout_title'.tr),
      body: WillPopScope(
        onWillPop: () {
          cartCon.couponFieldFocus.unfocus();
          Get.back();
          return Future.value(false);
        },
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CheckoutRadio(),
                  const CheckoutAddressesRadio(),
                  const Divider(thickness: 1.5),
                  const SizedBox(height: 15),
                  const CartPrice(),
                  GlobalCustomButton(
                    text: 'continue'.tr,
                    onPressed: () {
                      controller.finishOrder();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
