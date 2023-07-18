import 'package:e_commerce/controller/global/search_bar_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/view/widgets/items/item_list_elements/products_list_elements/product_image.dart';
import 'package:e_commerce/view/widgets/items/item_list_elements/products_list_elements/product_name.dart';
import 'package:e_commerce/view/widgets/items/item_list_elements/products_list_elements/product_price.dart';
import 'package:e_commerce/view/widgets/search/custom_search_handling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultsList extends GetView<SearchBarCon> {
  const SearchResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.willPop,
      child: SafeArea(
        child: GetBuilder<SearchBarCon>(
          builder: (controller) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: AppColors.grey,
                        size: 30,
                      ),
                      SizedBox(width: AppDecoration().screenWidth * .01),
                      Text(
                        'Search Result Found : ${controller.resultsCount}',
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 20,
                          fontFamily: 'Cairo',
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppDecoration().screenHeight * .02),
                SearchBarCustomHandling(
                  itemBuilder: (context, index) {
                    ItemsModel itemsModel =
                        ItemsModel.fromJson(controller.searchResult[index]);
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
              ],
            );
          },
        ),
      ),
    );
  }
}
