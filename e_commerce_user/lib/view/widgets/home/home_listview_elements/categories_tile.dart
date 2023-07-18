import 'package:e_commerce/controller/home/home_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/core/const/links.dart';
import 'package:e_commerce/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeCatergoriesTile extends GetView<HomeCon> {
  const HomeCatergoriesTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: AppDecoration().screenHeight * .14,
      width: AppDecoration().screenWidth,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            width: AppDecoration().screenWidth * .04,
          );
        },
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return HomeCatergoriesTileModel(
            lang: controller.lang,
            categorieModel: CategorieModel.fromJson(
              controller.categories[index],
            ),
          );
        },
      ),
    );
  }
}

class HomeCatergoriesTileModel extends GetView<HomeCon> {
  const HomeCatergoriesTileModel({
    super.key,
    required this.categorieModel,
    required this.lang,
  });
  final CategorieModel categorieModel;
  final String lang;
  @override
  Widget build(BuildContext context) {
    String catImg =
        '${AppLinks.categoriesImagesFolder}/${categorieModel.categorieImage!}';
    String catName = lang == 'ar'
        ? categorieModel.categorieNameAr!
        : categorieModel.categorieNameEn!;

    return GestureDetector(
      onTap: () {
        controller.goToItems(
          categorieModel: categorieModel,
        );
      },
      child: SizedBox(
        height: AppDecoration().screenHeight * .3,
        child: Column(
          children: [
            Container(
              height: AppDecoration().screenHeight * .1,
              padding: const EdgeInsets.fromLTRB(13, 0, 13, 0),
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ( catImg.toLowerCase().endsWith('.svg'))? SvgPicture.network(
                catImg,
                width: AppDecoration().screenWidth * 0.205,
                color: AppColors.boldBlue,
              ) : Image.network (
                 catImg,
                width: AppDecoration().screenWidth * 0.205,
              ),
            ),
            Text(
              catName,
              style: const TextStyle(color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
