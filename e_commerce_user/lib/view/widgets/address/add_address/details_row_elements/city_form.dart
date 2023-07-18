import 'package:e_commerce/controller/address/add_address_con.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAddCityForm extends GetView<AddressAddCon> {
  const AddressAddCityForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: AppDecoration().screenWidth * .4,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'city'.tr,
          ),
          controller: controller.cityCon,
          focusNode: controller.cityFocus,
          onEditingComplete: () {
            controller.streetFocus.requestFocus();
          },
          validator: (value) {
            if (value.toString().isEmpty) {
              return "empty".tr;
            }
            return null;
          },
        ),
      ),
    );
  }
}
