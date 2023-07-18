import 'package:e_commerce/core/localization/local_con.dart';
import 'package:e_commerce/core/services/my_services.dart';
import 'package:e_commerce/data/datasource/remote/orders_data.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/routes.dart';
import 'package:get/get.dart';

class DeliveryOrdersCon extends GetxController {
  MyServices myServices = Get.find();
  OrdersData ordersData = OrdersData(crud: Get.find());
  LocaleController localeController = Get.put(LocaleController());
  late String lang;
  late String userID;
  late String userName;
  late String userEmail;
  late String userPhone;
  late double couponDiscount = 0;
  late double price = 0;
  late double priceWithDiscount = 0;
  late double totalPrice = 0;
  bool loading = false;
  List ordersList = [];
  List ordersInDeliveryList = [];

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    lang = localeController.locale.toString();
    initUserData();
    getInDeliveryData();
  }

  initUserData() {
    userID = myServices.sharedPreferences.getString('user_id')!;
    userName = myServices.sharedPreferences.getString('user_username')!;
    userEmail = myServices.sharedPreferences.getString('user_email')!;
    userPhone = myServices.sharedPreferences.getString('user_phone')!;
  }

  getInDeliveryData() async {
    loading = true;
    update();
    myServices.ordersList.clear();
    var response = await ordersData.getOutForDeliveryData(
      userId: userID,
    );
    if (response['status'] == 'success') {
      ordersList = response['ordersview'];
      ordersInDeliveryList = response['ordersviewdelivery'];
    }
    priceCalculate();
    loading = false;
    update();
  }

  priceCalculate() {
    price = 0;
    couponDiscount = 0;
    if (ordersList.length > 1) {
      for (var element in ordersList) {
        ItemsModel orderModel = ItemsModel.fromJson(element);
        price =
            price + (orderModel.cartItemcount! * orderModel.priceWithDiscount!);
      }
    } else if (ordersList.length == 1) {
      ItemsModel orderModel = ItemsModel.fromJson(ordersList[0]);
      price =
          price + (orderModel.cartItemcount! * orderModel.priceWithDiscount!);
    }
    for (var element in ordersList) {
      if (element['coupon_discount'] > couponDiscount) {
        couponDiscount = double.parse(element['coupon_discount'].toString());
      }
    }
    priceWithDiscount = price - couponDiscount;
    totalPrice = priceWithDiscount + 200;
    update();
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
}
