import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:flutter/material.dart';

class HomeRecommendedImageBG extends StatelessWidget {
  const HomeRecommendedImageBG({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDecoration().screenHeight * 0.16,
      width: AppDecoration().screenWidth * 0.4,
      padding: const EdgeInsets.fromLTRB(13, 0, 13, 0),
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
