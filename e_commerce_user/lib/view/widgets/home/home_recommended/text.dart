import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class HomeText extends StatelessWidget {
  const HomeText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      style: const TextStyle(
        color: AppColors.boldBlueSecond,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
