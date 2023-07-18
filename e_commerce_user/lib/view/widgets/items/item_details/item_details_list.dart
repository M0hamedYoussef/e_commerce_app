import 'package:e_commerce/controller/items/item_details_con.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/core/const/image_asset.dart';
import 'package:e_commerce/view/widgets/global/upper_row/upper_row.dart';
import 'package:e_commerce/view/widgets/items/item_list_elements/products_list_elements/product_colors.dart';
import 'package:e_commerce/view/widgets/items/item_list_elements/products_list_elements/product_desc.dart';
import 'package:e_commerce/view/widgets/items/item_list_elements/products_list_elements/product_image.dart';
import 'package:e_commerce/view/widgets/items/item_list_elements/products_list_elements/product_name.dart';
import 'package:e_commerce/view/widgets/items/item_list_elements/products_list_elements/product_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ItemDetailsListView extends GetView<ItemDetailsCon> {
  const ItemDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.itemModel = Get.arguments['itemModel'];
    return GetBuilder<ItemDetailsCon>(
      builder: (controller) {
        if (controller.loading == true) {
          return Center(
            child: Lottie.asset(
              AppImageAsset.lottieLoading,
              width: AppDecoration().screenWidth * .7,
              height: AppDecoration().screenHeight * .6,
              frameRate: FrameRate(90),
            ),
          );
        } else {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Column(
                children: [
                  const UpperRow(),
                  SizedBox(height: AppDecoration().screenHeight * .01),
                  Expanded(
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: ProductName(
                                    lang: controller.lang,
                                    itemsModel: controller.itemModel,
                                  ),
                                ),
                              ),
                              ProductImage(
                                itemsModel: controller.itemModel,
                                sale: false,
                                sizedHeight: AppDecoration().screenHeight * .4,
                              ),
                              ProductPrice(
                                itemsModel: controller.itemModel,
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: ProductDetails(),
                                ),
                              ),
                              ProductColors(
                                itemModel: controller.itemModel,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
