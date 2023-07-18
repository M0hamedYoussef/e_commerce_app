import 'package:e_commerce_delivery/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title.tr,
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 30,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}
