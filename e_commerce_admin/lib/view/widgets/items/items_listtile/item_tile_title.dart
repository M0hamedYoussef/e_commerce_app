import 'package:e_commerce_admin/core/const/colors.dart';
import 'package:e_commerce_admin/data/model/items/items_model.dart';
import 'package:flutter/material.dart';

class ItemsTileTitle extends StatelessWidget {
  const ItemsTileTitle(
      {super.key, required this.itemsModel, required this.lang});
  final ItemsModel itemsModel;
  final String lang;
  @override
  Widget build(BuildContext context) {
    String itemname = lang.contains('ar')
        ? '${itemsModel.itemNameAr}'
        : '${itemsModel.itemNameEn}';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          itemname,
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
