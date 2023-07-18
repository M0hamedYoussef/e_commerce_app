import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/const/image_asset.dart';
import 'package:e_commerce/core/const/links.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.itemsModel,
    this.sizedHeight,
    this.sizedWidth,
    required this.sale,
  });
  final ItemsModel itemsModel;
  final double? sizedHeight;
  final double? sizedWidth;
  final bool sale;
  @override
  Widget build(BuildContext context) {
    String itemImg = '${AppLinks.itemImagesFolder}/${itemsModel.itemImage}';

    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Hero(
          tag: itemsModel.itemId!,
          child: SizedBox(
            height: sizedHeight,
            width: sizedWidth,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CachedNetworkImage(
                  imageUrl: itemImg,
                  fit: BoxFit.contain,
                ),
                if (sale == true)
                  if (itemsModel.priceWithDiscount != itemsModel.itemPrice)
                    SizedBox(
                      height: 150,
                      width: 40,
                      child: Lottie.asset(
                        AppImageAsset.lottieSale,
                        fit: BoxFit.cover,
                        repeat: false,
                        reverse: true,
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
