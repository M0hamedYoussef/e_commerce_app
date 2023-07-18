import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/view/widgets/home/home_recommended/list_view.dart';
import 'package:e_commerce/view/widgets/home/home_recommended/text.dart';
import 'package:flutter/material.dart';

class HomeRecommended extends StatelessWidget {
  const HomeRecommended({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const HomeText(text: 'home_text_0'),
        SizedBox(
          height: AppDecoration().screenHeight * .02,
        ),
        const HomeRecommendedListView(),
      ],
    );
  }
}
