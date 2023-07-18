import 'package:e_commerce_delivery/core/class/request_status.dart';
import 'package:e_commerce_delivery/core/const/colors.dart';
import 'package:e_commerce_delivery/core/functions/status_update.dart';
import 'package:e_commerce_delivery/core/localization/local_con.dart';
import 'package:e_commerce_delivery/core/services/my_services.dart';
import 'package:e_commerce_delivery/data/datasource/remote/orders/orders_data.dart';
import 'package:e_commerce_delivery/data/model/order_model.dart';
import 'package:e_commerce_delivery/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersCon extends GetxController {
  @override
  void onInit() {
    requsetStatus.addListener(
      () {
        if (requsetStatus.value == RequsetStatus.loading) {
          loading = true;
          update();
        } else {
          loading = false;
          update();
        }
      },
    );
    initUserData();
    getPrepared();
    lang = localeController.locale.toString().contains('ar') ? 'ar' : 'en';
    super.onInit();
  }

  String? deliveryID;
  String? deliveryName;
  String? deliveryEmail;
  String? deliveryPhone;
  bool loading = false;
  bool acceptedScreen = false;
  MyServices myServices = Get.find();
  OrdersData ordersData = OrdersData(crud: Get.find());
  LocaleController localeController = Get.put(LocaleController());
  ValueNotifier<RequsetStatus> requsetStatus =
      ValueNotifier(RequsetStatus.noState);
  late String lang;

  List ordersList = [];

  initUserData() {
    deliveryID = myServices.sharedPreferences.getString('delivery_id');
    deliveryName = myServices.sharedPreferences.getString('delivery_username');
    deliveryEmail = myServices.sharedPreferences.getString('delivery_email');
    deliveryPhone = myServices.sharedPreferences.getString('delivery_phone');
  }

  getPrepared() async {
    ordersList.clear();
    acceptedScreen = false;
    await myServices.sharedPreferences.setBool('inPrepared', true);
    requsetStatus.value = RequsetStatus.loading;
    var response = await ordersData.getPreparedOrderd();
    requsetStatus.value = statusUpdater(response: response);
    if (requsetStatus.value == RequsetStatus.success) {
      if (response['status'] == 'success') {
        ordersList = response['ordersviewdelivery'];
      }
    }
  }

  getAccepted() async {
    ordersList.clear();
    acceptedScreen = true;
    await myServices.sharedPreferences.setBool('inPrepared', false);
    requsetStatus.value = RequsetStatus.loading;
    var response = await ordersData.getAcceptedOrders(
      deliveryId: deliveryID!,
    );
    requsetStatus.value = statusUpdater(response: response);
    if (requsetStatus.value == RequsetStatus.success) {
      if (response['status'] == 'success') {
        ordersList = response['ordersviewdelivery'];
      }
    }
  }

  acceptOrder({required OrderModel orderModel}) async {
    ordersList
        .removeWhere((element) => element['order_id'] == orderModel.orderId);
    update();
    await ordersData.approveOrder(
      deliveryId: deliveryID!,
      createdDate: orderModel.orderCreateddate!.substring(0, 10),
      userId: orderModel.orderUserid.toString(),
    );
  }

  delivered({required OrderModel orderModel}) {
    Get.defaultDialog(
      title: 'alert'.tr,
      middleText: 'sure_complete'.tr,
      titleStyle: const TextStyle(
        color: AppColors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontFamily: 'Cairo',
      ),
      middleTextStyle: const TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Cairo',
      ),
      actions: [
        MaterialButton(
          onPressed: () async {
            Get.back();
            loading = true;
            update();
            await ordersData.deliveredOrder(
              userId: orderModel.orderUserid.toString(),
              createdDate: orderModel.orderCreateddate!.substring(0, 10),
            );
            getAccepted();
          },
          color: AppColors.blue,
          child: Text(
            'yes'.tr,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            Get.back();
          },
          color: AppColors.blue,
          child: Text(
            'no'.tr,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
          ),
        ),
      ],
    );
  }

  goToOrderDetails({required OrderModel orderModel}) {
    Get.toNamed(AppRoutes.orderdetails, arguments: {'orderModel': orderModel});
  }
}
