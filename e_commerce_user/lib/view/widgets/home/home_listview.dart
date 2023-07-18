import 'package:e_commerce/view/widgets/home/home_recommended/text.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/view/widgets/home/home_listview_elements/categories_tile.dart';
import 'package:e_commerce/view/widgets/home/home_listview_elements/discount_tile.dart';
import 'package:e_commerce/view/widgets/home/home_listview_elements/home_recommended.dart';
import 'package:e_commerce/view/widgets/global/upper_row/upper_row.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: ListView(
        physics: const BouncingScrollPhysics(
          parent: PageScrollPhysics(),
        ),
        children: const [
          UpperRow(),
          DiscountTile(),
          HomeText(text: 'cat_text'),
          HomeCatergoriesTile(),
          HomeRecommended(),
        ],
      ),
    );
  }
}
