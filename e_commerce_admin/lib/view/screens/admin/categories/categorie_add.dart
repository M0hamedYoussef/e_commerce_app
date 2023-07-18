import 'dart:io';
import 'package:e_commerce_admin/controller/admin/categories_con.dart';
import 'package:e_commerce_admin/core/const/decoration.dart';
import 'package:e_commerce_admin/view/widgets/auth/global/app_bar.dart';
import 'package:e_commerce_admin/view/widgets/auth/global/buttons/custom_button.dart';
import 'package:e_commerce_admin/view/widgets/auth/global/forms/custom_from.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorieAdd extends StatelessWidget {
  const CategorieAdd({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesCon controller = Get.put(CategoriesCon());

    return Scaffold(
      appBar: customAppBar(title: 'addCategorie'),
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
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: AppDecoration().screenHeight * 0.3,
                    ),
                    height: AppDecoration().screenHeight * 0.3,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        GetBuilder<CategoriesCon>(
                          builder: (controller) {
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                if (controller.image == null)
                                  GestureDetector(
                                    onTap: () {
                                      controller.pickImage();
                                    },
                                    child: SizedBox(
                                      height:
                                          AppDecoration().screenHeight * 0.3,
                                      child: const Icon(
                                        Icons.image,
                                        size: 100,
                                      ),
                                    ),
                                  ),
                                if (controller.image != null)
                                  GestureDetector(
                                    onTap: () {
                                      controller.pickImage();
                                    },
                                    child: Image.file(
                                      File(controller.image!.path),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                if (controller.image != null)
                                  Container(
                                    padding: const EdgeInsets.only(left: 15),
                                    width: double.infinity,
                                    alignment: Alignment.bottomLeft,
                                    child: const Icon(
                                      Icons.image,
                                      size: 35,
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  CustomFormField(
                    editingController: controller.categorieNameEn,
                    focusNode: controller.categorieEnFocus,
                    nextFocusNode: controller.categorieArFocus,
                    hint: 'categorie_name_en',
                  ),
                  CustomFormField(
                    editingController: controller.categorieNameAr,
                    focusNode: controller.categorieArFocus,
                    nextFocusNode: controller.categorieEnFocus,
                    lang: 'ar',
                    hint: 'categorie_name_ar',
                  ),
                  const Spacer(),
                  GlobalCustomButton(
                    text: 'add',
                    onPressed: () {
                      controller.addCategorie();
                    },
                  ),
                  SizedBox(height: AppDecoration().screenHeight * .04),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
