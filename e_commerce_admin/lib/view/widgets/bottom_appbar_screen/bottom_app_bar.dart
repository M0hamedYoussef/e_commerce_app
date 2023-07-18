import 'package:e_commerce_admin/controller/global/bottom_appbar_screen_con.dart';
import 'package:e_commerce_admin/data/model/global/bottom_appbar_model.dart';
import 'package:e_commerce_admin/view/widgets/bottom_appbar_screen/bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomAppBarScreenCon>(
      builder: (controller) {
        return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Row(
            children: [
              ...List.generate(
                controller.pages.length,
                (index) {
                  return Expanded(
                    child: BarItem(
                      bottomAppBarModel: BottomAppBarModel(
                        text: controller.pages[index]['title'],
                        iconData: controller.pages[index]['icon'],
                        isSelected: controller.currentPageIndex == index,
                        onPressed: () {
                          controller.changePage(index: index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
