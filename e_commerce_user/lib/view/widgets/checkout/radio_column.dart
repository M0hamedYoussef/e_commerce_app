import 'package:e_commerce/controller/cart/checkout_controller.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutRadio extends StatelessWidget {
  const CheckoutRadio({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutCon>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'paymentmethod'.tr,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            ...List.generate(
              controller.paymentMethodsList.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: InkWell(
                    onTap: () {
                      controller.changePaymentMethod(
                          newMethod: controller.paymentMethodsList[index]);
                    },
                    child: Row(
                      children: [
                        Radio(
                          value: controller.paymentMethodsList[index],
                          groupValue: controller.method,
                          fillColor: const MaterialStatePropertyAll(
                            AppColors.boldBlue,
                          ),
                          onChanged: (value) {
                            controller.changePaymentMethod(
                              newMethod: controller.paymentMethodsList[index],
                            );
                          },
                        ),
                        Text(
                          controller.paymentMethodsList[index].toLowerCase().tr,
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
