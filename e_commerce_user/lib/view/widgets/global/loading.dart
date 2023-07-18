import 'package:blur/blur.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/core/const/image_asset.dart';
import 'package:e_commerce/view/widgets/global/upper_row/upper_row.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, this.searchBar = true});
 final bool searchBar;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
        searchBar ?  Blur(
            blurColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Column(
                children: const [
                  UpperRow(),
                ],
              ),
            ),
          ) : const SizedBox(),
          Center(
            child: Lottie.asset(
              AppImageAsset.lottieLoading,
              width: AppDecoration().screenWidth * .4,
              frameRate: FrameRate(90),
            ),
          ),
        ],
      ),
    );
  }
}
