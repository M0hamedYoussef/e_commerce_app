import 'package:e_commerce_admin/core/const/colors.dart';
import 'package:e_commerce_admin/core/const/decoration.dart';
import 'package:e_commerce_admin/data/model/global/bottom_appbar_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class BarItem extends StatelessWidget {
  const BarItem({
    super.key,
    required this.bottomAppBarModel,
  });
  final BottomAppBarModel bottomAppBarModel;

  @override
  Widget build(BuildContext context) {
    Color myColor =
        bottomAppBarModel.isSelected! ? AppColors.blue : AppColors.greySplash;
    return InkWell(
      onTap: bottomAppBarModel.onPressed!,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: AppDecoration().screenHeight * 0.01),
          SizedBox(
            width: AppDecoration().screenWidth * 0.205,
            height: AppDecoration().screenHeight * 0.057,
            child: Icon(
              bottomAppBarModel.iconData!,
              color: myColor,
              size: 30,
            ),
          ),
          if (bottomAppBarModel.text!.isNotEmpty)
            Text(
              bottomAppBarModel.text!.tr,
            ),
          if (bottomAppBarModel.text!.isEmpty)
            SizedBox(height: AppDecoration().screenHeight * 0.015),
        ],
      ),
    );
  }
}
