import 'dart:io';
import 'package:e_commerce_admin/controller/admin/items_con.dart';
import 'package:e_commerce_admin/core/const/decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAddItemImage extends StatelessWidget {
  const CustomAddItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      constraints: BoxConstraints(
        maxHeight: AppDecoration().screenHeight * 0.3,
      ),
      height: AppDecoration().screenHeight * 0.3,
      child: GetBuilder<ItemsCon>(
        builder: (controller) {
          return Stack(
            alignment: Alignment.center,
            children: [
              if (controller.image == null)
                GestureDetector(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: SizedBox(
                    height: AppDecoration().screenHeight * 0.3,
                    child: const Icon(
                      Icons.image,
                      size: 100,
                    ),
                  ),
                ),
              if (controller.image != null)
                GestureDetector(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: Image.file(
                    File(controller.image!.path),
                    fit: BoxFit.fill,
                  ),
                ),
              if (controller.image != null)
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  width: double.infinity,
                  alignment: Alignment.bottomLeft,
                  child: const Icon(
                    Icons.image,
                    size: 35,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
