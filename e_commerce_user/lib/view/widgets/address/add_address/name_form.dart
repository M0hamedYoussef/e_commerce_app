import 'package:e_commerce/controller/address/add_address_con.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAddNameForm extends GetView<AddressAddCon> {
  const AddressAddNameForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'name'.tr,
        ),
        controller: controller.nameCon,
        focusNode: controller.nameFocus,
        onEditingComplete: () {
          controller.userPhoneFocus.requestFocus();
        },
        validator: (value) {
          if (value.toString().isEmpty) {
            return "empty".tr;
          }
          return null;
        },
      ),
    );
  }
}
