import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:flutter/material.dart';

class ProductName extends StatelessWidget {
  const ProductName({super.key, required this.lang, required this.itemsModel});
  final String lang;
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    String itemName =
        lang == 'ar' ? itemsModel.itemNameAr! : itemsModel.itemNameEn!;
    return Text(
      itemName,
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontFamily: 'Cairo',
      ),
    );
  }
}
