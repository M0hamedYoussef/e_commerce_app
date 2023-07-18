import 'package:e_commerce_admin/controller/admin/items_con.dart';
import 'package:e_commerce_admin/core/const/links.dart';
import 'package:e_commerce_admin/data/model/items/items_model.dart';
import 'package:e_commerce_admin/view/widgets/items/handling.dart';
import 'package:e_commerce_admin/view/widgets/items/items_listtile/item_tile_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsCon controller = Get.put(ItemsCon());

    return ItemsScreenHandling(
      itemBuilder: (context, index) {
        ItemsModel itemsModel = ItemsModel.fromJson(
          controller.itemsList[index],
        );

        return ListTile(
          onTap: () {
            controller.goToItemDetails(itemsModel: itemsModel);
          },
          leading: itemsModel.itemImage!.endsWith('.svg')
              ? SvgPicture.network(
                  '${AppLinks.itemImagesFolder}/${itemsModel.itemImage}',
                  height: 40,
                )
              : Image.network(
                  '${AppLinks.itemImagesFolder}/${itemsModel.itemImage}',
                  height: 40,
                ),
          title: ItemsTileTitle(
            itemsModel: itemsModel,
            lang: controller.lang,
          ),
        );
      },
    );
  }
}
