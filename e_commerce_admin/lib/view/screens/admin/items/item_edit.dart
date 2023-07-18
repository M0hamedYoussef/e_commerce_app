import 'package:e_commerce_admin/controller/admin/items_con.dart';
import 'package:e_commerce_admin/core/const/decoration.dart';
import 'package:e_commerce_admin/view/widgets/auth/global/app_bar.dart';
import 'package:e_commerce_admin/view/widgets/auth/global/buttons/custom_button.dart';
import 'package:e_commerce_admin/view/widgets/auth/global/forms/custom_from.dart';
import 'package:e_commerce_admin/view/widgets/items/edit/categorie_drop_down.dart';
import 'package:e_commerce_admin/view/widgets/items/edit/item_image.dart';
import 'package:e_commerce_admin/view/widgets/items/edit/itemactive_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemEdit extends StatelessWidget {
  const ItemEdit({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsCon controller = Get.put(ItemsCon());

    return Scaffold(
      appBar: customAppBar(
        title: 'edititem',
        deleteButton: true,
        deleteButtonOnPressed: () {
          controller.deleteItem();
        },
      ),
      body: Form(
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
                  SizedBox(height: AppDecoration().screenHeight * .04),
                  const CustomEditItemImage(),
                  const CategorieItemEditDropDown(),
                  const ActiveItemEditDropDown(),
                  CustomFormField(
                    editingController: controller.itemNameEn,
                    focusNode: controller.itemNameEnFocus,
                    nextFocusNode: controller.itemNameArFocus,
                    hint: 'item_name_en',
                  ),
                  CustomFormField(
                    editingController: controller.itemNameAr,
                    focusNode: controller.itemNameArFocus,
                    nextFocusNode: controller.itemDescEnFocus,
                    lang: 'ar',
                    hint: 'item_name_ar',
                  ),
                  CustomFormField(
                    editingController: controller.itemDescEn,
                    focusNode: controller.itemDescEnFocus,
                    nextFocusNode: controller.itemDescArFocus,
                    hint: 'item_desc_en',
                  ),
                  CustomFormField(
                    editingController: controller.itemDescAr,
                    focusNode: controller.itemDescArFocus,
                    nextFocusNode: controller.itemPriceFocus,
                    lang: 'ar',
                    hint: 'item_desc_ar',
                  ),
                  CustomFormField(
                    editingController: controller.itemPrice,
                    focusNode: controller.itemPriceFocus,
                    nextFocusNode: controller.itemPriceFocus,
                    lang: 'en',
                    hint: 'item_price',
                  ),
                  CustomFormField(
                    editingController: controller.itemDiscount,
                    focusNode: controller.itemDiscountFocus,
                    nextFocusNode: controller.itemColorsFocus,
                    lang: 'en',
                    hint: 'item_discount',
                  ),
                  CustomFormField(
                    editingController: controller.itemColors,
                    focusNode: controller.itemColorsFocus,
                    nextFocusNode: controller.itemPriceFocus,
                    lang: 'en',
                    hint: 'item_colors',
                  ),
                  CustomFormField(
                    editingController: controller.itemCount,
                    focusNode: controller.itemCountFocus,
                    nextFocusNode: controller.itemCountFocus,
                    lang: 'en',
                    hint: 'item_count',
                  ),
                  const Spacer(),
                  SizedBox(height: AppDecoration().screenHeight * .04),
                  GlobalCustomButton(
                    text: 'edit',
                    onPressed: () {
                      controller.fst.currentState!.validate();
                      controller.editItem();
                    },
                  ),
                  SizedBox(height: AppDecoration().screenHeight * .03),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
