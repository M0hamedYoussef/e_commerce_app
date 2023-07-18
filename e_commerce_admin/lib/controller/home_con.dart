import 'package:e_commerce_admin/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomeCon extends GetxController {
  List pages = [
    {
      'icon': Icons.shopping_bag_outlined,
      'name': 'orders_page',
      'route': AppRoutes.orders,
    },
    {
      'icon': Icons.category_outlined,
      'name': 'categories_page',
      'route': AppRoutes.categories,
    },
    {
      'icon': Icons.check_box_outline_blank_sharp,
      'name': 'items_page',
      'route': AppRoutes.items,
    },
    {
      'icon': Icons.settings,
      'name': 'settings_page',
      'route': AppRoutes.settings,
    },
  ];

  onIconPressed({required int index}) {
    Get.toNamed(pages[index]['route']);
  }

  goToOrders() {
    Get.toNamed(AppRoutes.orders);
  }

  goToSettings() {
    Get.toNamed(AppRoutes.settings);
  }

  goToCategories() {
    Get.toNamed(AppRoutes.categories);
  }

  goToItems() {
    // Get.toNamed(AppRoutes.items);
  }
}
