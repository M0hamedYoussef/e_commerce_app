import 'package:e_commerce/controller/cart/cart_controller.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCouponField extends StatelessWidget {
  const CartCouponField({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartCon>(
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.fromLTRB(27, 0, 27, 0),
          height: 70,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: controller.couponCon,
                        onEditingComplete: () {
                          controller.onCouponPressed();
                        },
                        focusNode: controller.couponFieldFocus,
                        enabled: !controller.couponLoading,
                        decoration: InputDecoration(
                          hintText: 'coupon'.tr,
                          hintStyle: const TextStyle(height: 1),
                          focusColor: AppColors.greyLight,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: controller.couponWorks == true
                                  ? AppColors.green
                                  : AppColors.greyLight,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: controller.couponWorks == true
                                  ? AppColors.green
                                  : AppColors.greyLight,
                            ),
                          ),
                          suffixIcon: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: controller.couponWorks == true
                                    ? AppColors.green
                                    : AppColors.greyLight,
                              ),
                            ),
                            child: MaterialButton(
                              minWidth: 40,
                              onPressed: () {
                                controller.onCouponPressed();
                              },
                              child: Icon(
                                Icons.check,
                                color: controller.couponWorks == true
                                    ? AppColors.green
                                    : AppColors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
