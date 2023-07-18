import 'package:e_commerce_delivery/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget customAppBar({
  required String title,
  Function? onPressed,
  bool backButton = true,
  bool back = true,
  bool addButton = false,
  Function? addButtonOnPressed,
  bool deleteButton = false,
  Function? deleteButtonOnPressed,
}) {
  return AppBar(
    title: Text(
      title.tr,
      style: const TextStyle(
        color: AppColors.grey,
        fontWeight: FontWeight.bold,
        fontFamily: 'Cairo',
        fontSize: 23,
      ),
      textAlign: TextAlign.center,
    ),
    centerTitle: true,
    backgroundColor: AppColors.bg,
    elevation: 0,
    leading: backButton == true
        ? IconButton(
            onPressed: () {
              back ? Get.back() : null;
              onPressed != null ? onPressed() : null;
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: AppColors.grey,
            iconSize: 18,
            splashColor: AppColors.greySplash,
            splashRadius: 24,
          )
        : null,
    actions: [
      if (addButton == true)
        IconButton(
          onPressed: () {
            addButtonOnPressed != null ? addButtonOnPressed() : null;
          },
          icon: const Icon(Icons.add),
          color: AppColors.grey,
          iconSize: 25,
          splashColor: AppColors.greySplash,
          splashRadius: 24,
        ),
      if (deleteButton == true)
        IconButton(
          onPressed: () {
            deleteButtonOnPressed != null ? deleteButtonOnPressed() : null;
          },
          icon: const Icon(Icons.delete_outline),
          color: AppColors.grey,
          iconSize: 25,
          splashColor: AppColors.greySplash,
          splashRadius: 24,
        ),
    ],
  );
}
