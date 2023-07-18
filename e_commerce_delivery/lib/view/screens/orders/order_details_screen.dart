import 'package:e_commerce_delivery/controller/order_details_con.dart';
import 'package:e_commerce_delivery/core/const/colors.dart';
import 'package:e_commerce_delivery/core/const/decoration.dart';
import 'package:e_commerce_delivery/core/const/image_asset.dart';
import 'package:e_commerce_delivery/view/widgets/auth/global/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderDetailsCon orderDetailsCon = Get.put(OrderDetailsCon());
    return Scaffold(
      appBar: customAppBar(
        title: 'details',
        back: false,
        onPressed: () {
          orderDetailsCon.closeMap();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          orderDetailsCon.completeOrder();
        },
        child: LottieBuilder.asset(
          AppImageAsset.lottieCheck,
          repeat: false,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: WillPopScope(
        onWillPop: orderDetailsCon.closeMap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            GetBuilder<OrderDetailsCon>(
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
                        controller.googleMapController = controllerMap;
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
                      '${'address'.tr} : ${orderDetailsCon.orderModel.addressName}',
                      style: const TextStyle(
                        color: AppColors.greyLight,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${'city'.tr} : ${orderDetailsCon.orderModel.addressCity}',
                      style: const TextStyle(
                        color: AppColors.greyLight,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${'street'.tr} : ${orderDetailsCon.orderModel.addressStreet}',
                      style: const TextStyle(
                        color: AppColors.greyLight,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${'phone'.tr} : ${orderDetailsCon.orderModel.addressPhonenumber}',
                      style: const TextStyle(
                        color: AppColors.greyLight,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${'itemscount'.tr} : ${orderDetailsCon.orderModel.orderItemscount}',
                      style: const TextStyle(
                        color: AppColors.greyLight,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${'paymentmethod'.tr} : ${orderDetailsCon.orderModel.orderPaymentmethod}',
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
