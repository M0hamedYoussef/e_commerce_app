import 'package:e_commerce/controller/global/notifications_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/core/const/image_asset.dart';
import 'package:e_commerce/data/model/notifications_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';

class NotificationsListHandling extends StatelessWidget {
  const NotificationsListHandling({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsCon>(
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
          if (controller.myServices.notifications.isEmpty) {
            return Center(
              child: Lottie.asset(
                AppImageAsset.lottieEmpty,
                width: AppDecoration().screenWidth * .7,
                height: AppDecoration().screenHeight * .6,
                frameRate: FrameRate(90),
              ),
            );
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: controller.myServices.notifications.length,
              itemBuilder: (context, index) {
                NotificationModel notificationModel =
                    NotificationModel.fromJson(
                        controller.myServices.notifications[index]);
                return Card(
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          notificationModel.notificationTitle!,
                          style: const TextStyle(
                            color: AppColors.black,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w200,
                            height: 1,
                            fontSize: 19,
                          ),
                        ),
                        Text(
                          Jiffy(notificationModel.notificationDate).fromNow(),
                          style: const TextStyle(
                            color: AppColors.grey,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w200,
                            fontSize: 15,
                            height: 0.1,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      notificationModel.notificationMessage!,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w200,
                        height: 1.5,
                        fontSize: 18,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }
      },
    );
  }
}
