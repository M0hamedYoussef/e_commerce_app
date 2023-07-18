import 'package:e_commerce/controller/home/home_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeRecommendedItemName extends GetView<HomeCon> {
  const HomeRecommendedItemName({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return HomeRecommendedItemNameModel(
      itemsModel: ItemsModel.fromJson(controller.items[index]),
      lang: controller.lang,
    );
  }
}

class HomeRecommendedItemNameModel extends StatelessWidget {
  const HomeRecommendedItemNameModel(
      {super.key, required this.itemsModel, required this.lang});
  final ItemsModel itemsModel;
  final String lang;
  @override
  Widget build(BuildContext context) {
    String itemName =
        lang == 'en' ? itemsModel.itemNameEn! : itemsModel.itemNameAr!;
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        itemName,
        style: const TextStyle(
          color: AppColors.white,
          fontFamily: 'Cairo',
          fontSize: 20,
        ),
      ),
    );
  }
}
