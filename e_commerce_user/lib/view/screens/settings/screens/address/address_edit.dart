import 'package:e_commerce/controller/address/edit_address_con.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/view/widgets/address/edit_address/edit_details_row.dart';
import 'package:e_commerce/view/widgets/address/edit_address/edit_map.dart';
import 'package:e_commerce/view/widgets/address/edit_address/name_form.dart';
import 'package:e_commerce/view/widgets/address/edit_address/phone_form.dart';
import 'package:e_commerce/view/widgets/auth/global/app_bar.dart';
import 'package:e_commerce/view/widgets/auth/global/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddressEditCon controller = Get.put(AddressEditCon());
    return Scaffold(
      appBar: customAppBar(
        title: 'editaddress',
        deleteButton: true,
        deleteButtonOnPressed: () {
          controller.deleteData();
        },
      ),
      body: WillPopScope(
        onWillPop: controller.closeMap,
        child: Form(
          key: controller.fst,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: PageScrollPhysics(),
            ),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const AddressEditMap(),
                    const AddressEditNameForm(),
                    const AddressEditPhoneForm(),
                    const AddressEditDetailsRow(),
                    SizedBox(height: AppDecoration().screenHeight * .04),
                    const Spacer(),
                    GlobalCustomButton(
                      text: 'confirm',
                      onPressed: () {
                        controller.editValidate();
                      },
                    ),
                    SizedBox(height: AppDecoration().screenHeight * .04),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
