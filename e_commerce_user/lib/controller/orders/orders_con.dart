import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/localization/local_con.dart';
import 'package:e_commerce/core/services/my_services.dart';
import 'package:e_commerce/data/datasource/remote/orders_data.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersCon extends GetxController {
  MyServices myServices = Get.find();
  OrdersData ordersData = OrdersData(crud: Get.find());
  LocaleController localeController = Get.put(LocaleController());
  bool loading = false;
  bool inArchive = false;
  bool inDelivery = false;
  late String lang;
  late String userID;
  late String userName;
  late String userEmail;
  late String userPhone;

  late double couponDiscount;
  late double price;
  late double priceWithDiscount;
  late double totalPrice;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    lang = localeController.locale.toString();
    initUserData();
    priceCalculate();
  }

  initUserData() {
    userID = myServices.sharedPreferences.getString('user_id')!;
    userName = myServices.sharedPreferences.getString('user_username')!;
    userEmail = myServices.sharedPreferences.getString('user_email')!;
    userPhone = myServices.sharedPreferences.getString('user_phone')!;
  }

  getData() async {
    loading = true;
    update();
    inArchive = false;
    inDelivery = false;
    myServices.ordersList.clear();
    await myServices.getOrders(userId: userID);
    priceCalculate();
    loading = false;
    update();
  }

  getArchiveData() async {
    loading = true;
    update();
    inArchive = true;
    inDelivery = false;
    myServices.ordersList.clear();
    await myServices.getArchivedOrders(userId: userID);
    priceCalculate();
    loading = false;
    update();
  }

  rateOrder({
    required String orderId,
    required String orderRate,
  }) async {
    await ordersData.rateOrder(
      userId: userID,
      orderId: orderId,
      orderRate: orderRate,
    );
  }

  priceCalculate() async {
    price = 0;
    couponDiscount = 0;
    if (myServices.ordersList.length > 1) {
      for (var element in myServices.ordersList) {
        ItemsModel orderModel = ItemsModel.fromJson(element);
        if (orderModel.orderStatus != 'canceled' &&
            orderModel.orderStatus != 'done') {
          price = price +
              (orderModel.cartItemcount! * orderModel.priceWithDiscount!);
        }
      }
    } else if (myServices.ordersList.length == 1) {
      ItemsModel orderModel = ItemsModel.fromJson(myServices.ordersList[0]);
      if (orderModel.orderStatus != 'canceled' &&
          orderModel.orderStatus != 'done') {
        price =
            price + (orderModel.cartItemcount! * orderModel.priceWithDiscount!);
      }
    }
    for (var element in myServices.ordersList) {
      if (element['coupon_discount'] > couponDiscount &&
          element['order_status'] == 'pending') {
        couponDiscount = double.parse(element['coupon_discount'].toString());
      }
    }
    priceWithDiscount = price - couponDiscount;
    totalPrice = priceWithDiscount + 200;
    update();
  }

  deleteOrder({required ItemsModel orderModel}) async {
    Get.defaultDialog(
      title: 'alert'.tr,
      middleText: 'cancel_order_alert'.tr,
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
            await ordersData.deleteData(
              userId: userID,
              orderId: orderModel.orderId.toString(),
            );
            await getData();
            Get.back();
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

  goToDetails({required ItemsModel itemsModel}) {
    Get.toNamed(
      AppRoutes.itemDetails,
      arguments: {
        'itemModel': itemsModel,
        'selectedColor': itemsModel.cartItemcolor,
      },
    );
  }

  goToMap({required ItemsModel orderModel}) {
    Get.toNamed(
      AppRoutes.ordersMap,
      arguments: {
        'orderModel': orderModel,
      },
    );
  }

  goToInDelivery() {
    Get.toNamed(
      AppRoutes.ordersInDelivery,
    );
  }
}
