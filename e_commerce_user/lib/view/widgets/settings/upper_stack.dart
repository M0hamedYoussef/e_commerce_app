import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/core/const/image_asset.dart';
import 'package:flutter/material.dart';


class SettingStack extends StatelessWidget {
  const SettingStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: AppDecoration().screenHeight * .26,
              decoration: const BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
            ),
            Positioned(
              top: AppDecoration().screenHeight * .2,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xffE4E6E7),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage(AppImageAsset.profile),
                  backgroundColor: AppColors.greyDesign,
                  radius: 30,
                ),
              ),
            ),
          ],
        );
  }
}