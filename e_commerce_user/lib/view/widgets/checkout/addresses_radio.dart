import 'package:e_commerce/controller/cart/checkout_controller.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:e_commerce/view/widgets/address/address_listtile/address_tile_subtitle.dart';
import 'package:e_commerce/view/widgets/address/address_listtile/address_tile_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutAddressesRadio extends StatelessWidget {
  const CheckoutAddressesRadio({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutCon>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'chooseaddress'.tr,
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.goToAddresses();
                    },
                    icon: const Icon(
                      Icons.info_outline,
                    ),
                    splashRadius: 20,
                    color: AppColors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppDecoration().screenHeight * .2,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: controller.addressesList.length,
                itemBuilder: (context, index) {
                  AddressModel addressModel =
                      AddressModel.fromJson(controller.addressesList[index]);
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Card(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        decoration: BoxDecoration(
                          border: controller.selectedAddress ==
                                  addressModel.addressName
                              ? Border.all(
                                  color: AppColors.boldBlue,
                                  width: 1,
                                )
                              : null,
                        ),
                        child: ListTile(
                          onTap: () {
                            controller.changeAddress(
                                addressModel: addressModel);
                          },
                          title: AddressTileTitle(addressModel: addressModel),
                          subtitle:
                              AddressTileSubtitle(addressModel: addressModel),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
