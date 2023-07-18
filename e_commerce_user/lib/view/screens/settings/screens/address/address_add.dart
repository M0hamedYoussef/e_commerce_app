import 'package:e_commerce/controller/address/add_address_con.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/view/widgets/address/add_address/add_map.dart';
import 'package:e_commerce/view/widgets/address/add_address/add_details_row.dart';
import 'package:e_commerce/view/widgets/address/add_address/name_form.dart';
import 'package:e_commerce/view/widgets/address/add_address/phone_form.dart';
import 'package:e_commerce/view/widgets/auth/global/app_bar.dart';
import 'package:e_commerce/view/widgets/auth/global/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddressAddCon controller = Get.put(AddressAddCon());

    return Scaffold(
      appBar: customAppBar(title: 'addaddress'),
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
                    const AddressAddMap(),
                    const AddressAddNameForm(),
                    const AddressAddPhoneForm(),
                    const AddressAddDetailsRow(),
                    SizedBox(height: AppDecoration().screenHeight * .04),
                    const Spacer(),
                    GlobalCustomButton(
                      text: 'add',
                      onPressed: () {
                        controller.addValidate();
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
