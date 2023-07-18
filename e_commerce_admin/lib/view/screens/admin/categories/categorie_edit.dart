import 'dart:io';
import 'package:e_commerce_admin/controller/admin/categories_con.dart';
import 'package:e_commerce_admin/core/const/decoration.dart';
import 'package:e_commerce_admin/core/const/links.dart';
import 'package:e_commerce_admin/view/widgets/auth/global/app_bar.dart';
import 'package:e_commerce_admin/view/widgets/auth/global/buttons/custom_button.dart';
import 'package:e_commerce_admin/view/widgets/auth/global/forms/custom_from.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategorieEdit extends StatelessWidget {
  const CategorieEdit({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesCon controller = Get.put(CategoriesCon());

    return Scaffold(
      appBar: customAppBar(
        title: 'editcategorie',
        deleteButton: true,
        deleteButtonOnPressed: () {
          controller.deleteCategorie();
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
                                if (controller.image == null)
                                  GestureDetector(
                                    onTap: () {
                                      controller.pickImage();
                                    },
                                    child: controller
                                            .selectedCategorie.categorieImage!
                                            .endsWith('.svg')
                                        ? SvgPicture.network(
                                            '${AppLinks.categoriesImagesFolder}/${controller.selectedCategorie.categorieImage}',
                                            height: 40,
                                          )
                                        : Image.network(
                                            '${AppLinks.categoriesImagesFolder}/${controller.selectedCategorie.categorieImage}',
                                            height: 40,
                                          ),
                                  ),
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
                    text: 'edit',
                    onPressed: () {
                      controller.editCategorie();
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
