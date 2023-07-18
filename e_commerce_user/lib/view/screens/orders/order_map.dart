import 'package:e_commerce/controller/orders/indelivery/order_onmap_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/core/const/image_asset.dart';
import 'package:e_commerce/view/widgets/auth/global/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

class OrdersMapScreen extends StatelessWidget {
  const OrdersMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersMapCon controller = Get.put(OrdersMapCon());
    return Scaffold(
      appBar: customAppBar(
        title: 'tracking',
        back: false,
        onPressed: () {
          controller.closeMap();
        },
      ),
      body: WillPopScope(
        onWillPop: controller.closeMap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            GetBuilder<OrdersMapCon>(
              builder: (controller) {
                if (controller.loadingForLocation) {
                  return Center(
                    child: Lottie.asset(
                      AppImageAsset.lottieLoading,
                      width: AppDecoration().screenWidth * .7,
                      height: AppDecoration().screenHeight * .6,
                      frameRate: FrameRate(90),
                    ),
                  );
                } else {
                  if (!controller.close) {
                    return GoogleMap(
                      initialCameraPosition: controller.cameraPosition ??
                          const CameraPosition(target: LatLng(0, 0)),
                      mapType: MapType.normal,
                      polylines: controller.polylineSet,
                      markers: controller.myMarkers.toSet(),
                      onTap: (argument) {},
                      onMapCreated: (controllerMap) {
                        controller.googleMapController.complete(controllerMap);
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                }
              },
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: AppDecoration().screenWidth * 0.45,
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                    width: 0.1,
                    color: AppColors.black,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '${'address'.tr} : ${controller.orderModel.addressName}',
                      style: const TextStyle(
                        color: AppColors.greyLight,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${'city'.tr} : ${controller.orderModel.addressCity}',
                      style: const TextStyle(
                        color: AppColors.greyLight,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${'street'.tr} : ${controller.orderModel.addressStreet}',
                      style: const TextStyle(
                        color: AppColors.greyLight,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${'phone'.tr} : ${controller.orderModel.addressPhonenumber}',
                      style: const TextStyle(
                        color: AppColors.greyLight,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
