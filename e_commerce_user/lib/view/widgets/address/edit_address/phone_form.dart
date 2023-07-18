import 'package:e_commerce/controller/address/edit_address_con.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressEditPhoneForm extends GetView<AddressEditCon> {
  const AddressEditPhoneForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'phone'.tr,
        ),
        controller: controller.userPhoneCon,
        focusNode: controller.userPhoneFocus,
        onEditingComplete: () {
          controller.cityFocus.requestFocus();
        },
        keyboardType: TextInputType.number,
        validator: (value) {
          if (!GetUtils.isPhoneNumber(value ?? '')) {
            return "tele_valid".tr;
          }
          return null;
        },
      ),
    );
  }
}
