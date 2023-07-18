import 'package:e_commerce_delivery/core/const/colors.dart';
import 'package:e_commerce_delivery/core/const/decoration.dart';
import 'package:e_commerce_delivery/data/model/bottom_appbar_model.dart';
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
          SizedBox(
            width: AppDecoration().screenWidth * 0.205,
            height: AppDecoration().screenHeight * 0.057,
            child: Icon(
              bottomAppBarModel.iconData!,
              color: myColor,
            ),
          ),
          Text(
            bottomAppBarModel.text!.tr,
          ),
        ],
      ),
    );
  }
}
