import 'package:e_commerce/controller/items/items_con.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/view/widgets/global/loading.dart';
import 'package:e_commerce/view/widgets/global/upper_row/upper_row.dart';
import 'package:e_commerce/view/widgets/items/item_list_elements/categories_list.dart';
import 'package:e_commerce/view/widgets/items/item_list_elements/products_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsListView extends GetView<ItemsCon> {
  const ItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Column(
          children: [
            const UpperRow(),
            const ItemsCategoriesList(),
            GetBuilder<ItemsCon>(
              builder: (controller) {
                if (controller.loading == true) {
                  return SizedBox(
                    height: AppDecoration().screenHeight * .6,
                    child: const Loading(
                      searchBar: false,
                    ),
                  );
                } else {
                  return const ProductsList();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
