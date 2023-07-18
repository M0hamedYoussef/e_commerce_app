import 'package:e_commerce_admin/controller/admin/categories_con.dart';
import 'package:e_commerce_admin/core/const/links.dart';
import 'package:e_commerce_admin/data/model/categories/categories_mode.dart';
import 'package:e_commerce_admin/view/widgets/categories/categorie_listtile/categorie_tile_title.dart';
import 'package:e_commerce_admin/view/widgets/categories/handling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesCon controller = Get.put(CategoriesCon());

    return CategorieScreenHandling(
      itemBuilder: (context, index) {
        CategoriesModel categoriesModel =
            CategoriesModel.fromJson(controller.categoriesList[index]);

        return ListTile(
          onTap: () {
            controller.goToCategorieDetails(categoriesModel: categoriesModel);
          },
          leading: categoriesModel.categorieImage!.endsWith('.svg')
              ? SvgPicture.network(
                  '${AppLinks.categoriesImagesFolder}/${categoriesModel.categorieImage}',
                  height: 40,
                )
              : Image.network(
                  '${AppLinks.categoriesImagesFolder}/${categoriesModel.categorieImage}',
                  height: 40,
                ),
          title: CategoriesTileTitle(
            categorieModel: categoriesModel,
            lang: controller.lang,
          ),
        );
      },
    );
  }
}
