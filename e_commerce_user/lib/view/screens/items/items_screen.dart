import 'package:e_commerce/controller/items/items_con.dart';
import 'package:e_commerce/view/widgets/items/items_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsCon());

    return const Scaffold(
      body: ItemsListView(),
    );
  }
}
