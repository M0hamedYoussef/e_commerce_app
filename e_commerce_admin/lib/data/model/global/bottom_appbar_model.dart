import 'package:flutter/material.dart';

class BottomAppBarModel {
  void Function()? onPressed;
  String? text;
  IconData? iconData;
  String? categorieNameAr;
  bool? isSelected;

  BottomAppBarModel({
    this.onPressed,
    this.text,
    this.iconData,
    this.isSelected,
  });
}
