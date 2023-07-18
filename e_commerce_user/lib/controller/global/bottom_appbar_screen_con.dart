import 'package:e_commerce/routes.dart';
import 'package:e_commerce/view/screens/favourites/favourite.dart';
import 'package:e_commerce/view/screens/home/home_page.dart';
import 'package:e_commerce/view/screens/orders/orders_screen.dart';
import 'package:e_commerce/view/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppBarScreenCon extends GetxController {
  int currentPageIndex = 0;

  List pages = [
    {
      'route': const HomePage(),
      'title': 'home_page',
      'icon': Icons.home,
    },
    {
      'route': const FavouritesScreen(),
      'title': 'favourite_page',
      'icon': Icons.favorite,
    },
    {
      'route': const OrdersScreen(),
      'title': 'orders_page',
      'icon': Icons.shopping_bag,
    },
    {
      'route': const SettingsScreen(),
      'title': 'settings_page',
      'icon': Icons.settings,
    },
  ];

  changePage({required int index}) {
    currentPageIndex = index;
    update();
  }



  onFloatingPressed() {
    Get.toNamed(AppRoutes.cart);
  }
}
