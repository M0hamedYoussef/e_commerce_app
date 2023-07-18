import 'package:e_commerce/controller/favourites/favourites_con.dart';
import 'package:e_commerce/view/widgets/favourites/fav_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesCon());

    return const FavsList();
  }
}
