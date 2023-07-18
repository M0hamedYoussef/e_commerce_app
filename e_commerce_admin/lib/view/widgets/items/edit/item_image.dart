import 'dart:io';

import 'package:e_commerce_admin/controller/admin/items_con.dart';
import 'package:e_commerce_admin/core/const/decoration.dart';
import 'package:e_commerce_admin/core/const/links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomEditItemImage extends StatelessWidget {
  const CustomEditItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: AppDecoration().screenHeight * 0.3,
      ),
      height: AppDecoration().screenHeight * 0.3,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          GetBuilder<ItemsCon>(
            builder: (controller) {
              return Stack(
                alignment: Alignment.center,
                children: [
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
                  if (controller.image == null)
                    GestureDetector(
                      onTap: () {
                        controller.pickImage();
                      },
                      child: Image.network(
                        '${AppLinks.itemImagesFolder}/${controller.selectedItem.itemImage}',
                      ),
                    ),
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
        ],
      ),
    );
  }
}
