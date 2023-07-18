import 'package:e_commerce_delivery/core/const/colors.dart';
import 'package:e_commerce_delivery/core/localization/local_con.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLangButton extends StatelessWidget {
  const CustomLangButton({super.key, required this.lang});
  final String lang;
  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    return MaterialButton(
      color: AppColors.blue,
      
      onPressed: () {
        localeController.change(lang);
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Text(
            lang,
            style: const TextStyle(
              color: AppColors.white,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
