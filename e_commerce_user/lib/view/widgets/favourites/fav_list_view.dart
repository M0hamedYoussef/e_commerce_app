import 'package:e_commerce/controller/favourites/favourites_con.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/view/widgets/favourites/custom_listview.dart';
import 'package:e_commerce/view/widgets/items/item_list_elements/products_list_elements/product_image.dart';
import 'package:e_commerce/view/widgets/items/item_list_elements/products_list_elements/product_name.dart';
import 'package:e_commerce/view/widgets/items/item_list_elements/products_list_elements/product_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavsList extends StatelessWidget {
  const FavsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritesCon>(
      builder: (controller) => FavouritesCustomListView(
        itemBuilder: (context, index) {
          ItemsModel itemsModel =
              ItemsModel.fromJson(controller.favourites[index]);
          return GestureDetector(
            onTap: () {
              controller.goToDetails(itemsModel: itemsModel);
            },
            child: Card(
              child: Flex(
                direction: Axis.vertical,
                children: [
                  ProductImage(
                    itemsModel: itemsModel,
                    sale: true,
                    sizedHeight: AppDecoration().screenHeight * .4,
                  ),
                  ProductName(
                    lang: controller.lang,
                    itemsModel: itemsModel,
                  ),
                  ProductPrice(
                    itemsModel: itemsModel,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
