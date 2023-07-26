import 'package:e_commerce_admin/view/screens/admin/orders/orders_all_screen.dart';
import 'package:e_commerce_admin/view/screens/admin/orders/orders_approved_screen.dart';
import 'package:e_commerce_admin/view/screens/admin/orders/orders_inprepare_screen.dart';
import 'package:e_commerce_admin/view/screens/admin/orders/orders_pending_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppBarScreenCon extends GetxController {
  int currentPageIndex = 0;

  List pages = [
    {
      'route': const OrdersAllPage(),
      'bartitle': 'orders_page',
      'title': 'orders_page',
      'icon': Icons.shopping_bag_outlined,
    },
    {
      'route': const OrdersPreparingPage(),
      'bartitle': 'prepare_page',
      'title': 'prepare_page',
      'icon': Icons.shopping_bag_outlined,
    },
    {
      'route': const OrdersApprovedPage(),
      'bartitle': 'approved_orders_page',
      'title': 'approved_orders_page',
      'icon': Icons.shopping_bag_outlined,
    },
    {
      'route': const OrdersPendingPage(),
      'bartitle': 'pending_orders_page',
      'title': 'pending_orders_page',
      'icon': Icons.shopping_bag_outlined,
    },
  ];

  changePage({required int index}) {
    currentPageIndex = index;
    update();
  }
}
