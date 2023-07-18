import 'package:e_commerce/controller/cart/cart_controller.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/view/widgets/auth/global/buttons/custom_button.dart';
import 'package:e_commerce/view/widgets/cart/cart_handling.dart';
import 'package:e_commerce/view/widgets/cart/cart_item_options.dart';
import 'package:e_commerce/view/widgets/cart/cart_price.dart';
import 'package:e_commerce/view/widgets/cart/coupon_field.dart';
import 'package:e_commerce/view/widgets/items/item_list_elements/products_list_elements/product_image.dart';
import 'package:e_commerce/view/widgets/items/item_list_elements/products_list_elements/product_name.dart';
import 'package:e_commerce/view/widgets/items/item_list_elements/products_list_elements/product_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartCon>(
      builder: (controller) {
        return Column(
          children: [
            Expanded(
              child: CartCustomHandling(
                itemBuilder: (context, index) {
                  ItemsModel itemsModel = ItemsModel.fromJson(
                      controller.myServices.cartItems[index]);
                  return GestureDetector(
                    onTap: () {
                      controller.goToDetails(itemsModel: itemsModel);
                    },
                    child: Card(
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          ProductImage(
                            itemsModel: itemsModel,
                            sale: false,
                            sizedHeight: AppDecoration().screenHeight * .4,
                          ),
                          ProductName(
                            lang: controller.lang,
                            itemsModel: itemsModel,
                          ),
                          ProductPrice(
                            itemsModel: itemsModel,
                          ),
                          CartItemOptions(
                            index: index,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            if (controller.myServices.cartItems.isNotEmpty)
              const CartCouponField(),
            if (controller.myServices.cartItems.isNotEmpty) const CartPrice(),
            if (controller.myServices.cartItems.isNotEmpty)
              GlobalCustomButton(
                text: 'order',
                onPressed: () {
                  controller.onPlaceOrder();
                  controller.couponFieldFocus.unfocus();
                },
              ),
            SizedBox(height: AppDecoration().screenHeight * .02),
          ],
        );
      },
    );
  }
}
