import 'dart:io';
import 'package:e_commerce_delivery/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> exitAlert() {
  Get.defaultDialog(
    title: 'exit_alert_title'.tr,
    middleText: 'exit_alert_body'.tr,
    titleStyle: const TextStyle(
      color: AppColors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Cairo',
    ),
    middleTextStyle: const TextStyle(
      color: AppColors.black,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Cairo',
    ),
    actions: [
      MaterialButton(
        onPressed: () {
          exit(0);
        },
        color: AppColors.blue,
        child: Text(
          'yes'.tr,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
          ),
        ),
      ),
      MaterialButton(
        onPressed: () {
          Get.back();
        },
        color: AppColors.blue,
        child: Text(
          'no'.tr,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
          ),
        ),
      ),
    ],
  );
  return Future.value(false);
}
