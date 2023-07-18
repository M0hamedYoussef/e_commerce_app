import 'package:e_commerce/controller/favourites/favourites_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key, required this.itemsModel});
  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    FavoritesCon favoritesCon = Get.put(FavoritesCon());
    double itemOldPrice = itemsModel.itemPrice!;
    double itemTotalPrice = itemsModel.priceWithDiscount ?? 0;
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 4, 0, 0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'EGP ',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 11,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
                Column(
                  children: [
                    if (itemOldPrice != itemTotalPrice)
                      Text(
                        NumberFormat('#,###').format(itemOldPrice),
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontFamily: 'Cairo',
                          decoration: TextDecoration.lineThrough,
                          height: .01,
                        ),
                      ),
                    Text(
                      NumberFormat('#,###').format(itemTotalPrice),
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 20,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () async {
                  favoritesCon.onPressed(itemsModel: itemsModel);
                },
                icon: GetBuilder<FavoritesCon>(
                  builder: (con) =>
                      favoritesCon.favIcon(itemsModel: itemsModel),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
