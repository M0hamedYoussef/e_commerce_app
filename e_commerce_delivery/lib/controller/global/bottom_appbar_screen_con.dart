import 'package:e_commerce_delivery/view/screens/home/orders_page.dart';
import 'package:e_commerce_delivery/view/screens/orders/accepted_orders.dart';
import 'package:e_commerce_delivery/view/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppBarScreenCon extends GetxController {
  int currentPageIndex = 0;

  List pages = [
    {
      'route': const OrdersPage(),
      'title': 'orders_page',
      'icon': Icons.shopping_bag_outlined,
    },
    {
      'route': const AcceptedOrdersPage(),
      'title': 'accepted_page',
      'icon': Icons.delivery_dining_outlined,
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
}
