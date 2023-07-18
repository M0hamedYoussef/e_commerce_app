import 'package:e_commerce_admin/core/const/colors.dart';
import 'package:e_commerce_admin/data/model/categories/categories_mode.dart';
import 'package:flutter/material.dart';

class CategoriesTileTitle extends StatelessWidget {
  const CategoriesTileTitle({super.key, required this.categorieModel, required this.lang});
  final CategoriesModel categorieModel;
  final String lang;
  @override
  Widget build(BuildContext context) {
    String cat =
       lang.contains('ar') ?  '${categorieModel.categorieNameAr}' :'${categorieModel.categorieNameEn}' ;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          cat,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w400,
            fontSize: 15,
            height: 1,
            color: AppColors.grey,
          ),
        ),

      ],
    );
  }
}
