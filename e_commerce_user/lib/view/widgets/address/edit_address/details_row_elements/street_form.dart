import 'package:e_commerce/controller/address/edit_address_con.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressEditStreetForm extends GetView<AddressEditCon> {
  const AddressEditStreetForm(
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: AppDecoration().screenWidth * .5,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'street'.tr,
          ),
          controller: controller.streetCon,
          focusNode: controller.streetFocus,
          onEditingComplete: () {
            controller.editValidate();
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
