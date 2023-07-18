import 'package:e_commerce_delivery/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDecoration {
  double screenHeight = Get.height;
  double screenWidth = Get.width;

  static OutlineInputBorder otb = OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: const BorderSide(color: AppColors.grey),
  );
  static OutlineInputBorder errorOTB = OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: const BorderSide(color: AppColors.red),
  );

  static InputDecoration myinputDecoration({
    bool needLabel = true,
    String label = '',
    required String hint,
    Widget suffixIcon = const SizedBox(),
    Widget prefixIcon = const SizedBox(),
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 9, horizontal: 7),
      border: otb,
      enabledBorder: otb,
      focusedBorder: otb,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      label: needLabel
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label.tr,
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
            )
          : null,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      hintText: hint.tr,
      hintStyle: const TextStyle(fontSize: 15),
    );
  }
}
