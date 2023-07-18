import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/core/const/links.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:flutter/material.dart';

class HomeRecommendedItemImage extends StatelessWidget {
  const HomeRecommendedItemImage({super.key, required this.itemsModel});
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return HomeRecommendedItemModel(
      itemsModel: itemsModel,
    );
  }
}

class HomeRecommendedItemModel extends StatelessWidget {
  const HomeRecommendedItemModel({super.key, required this.itemsModel});
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    String catImg = '${AppLinks.itemImagesFolder}/${itemsModel.itemImage}';
    return Container(
      height: AppDecoration().screenHeight * 0.16,
      width: AppDecoration().screenWidth * 0.4,
      padding: const EdgeInsets.fromLTRB(13, 0, 13, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: CachedNetworkImage(
        imageUrl: catImg,
        fit: BoxFit.contain,
      ),
    );
  }
}
