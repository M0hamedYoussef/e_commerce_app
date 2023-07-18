import 'package:e_commerce_admin/core/localization/local_con.dart';
import 'package:e_commerce_admin/core/services/my_services.dart';
import 'package:e_commerce_admin/data/datasource/remote/orders/orders_data.dart';
import 'package:e_commerce_admin/data/model/orders/order_model.dart';
import 'package:get/get.dart';

class OrdersCon extends GetxController {
  @override
  onInit() async {
    initUserData();
    lang = localeController.locale.toString().contains('ar') ? 'ar' : 'en';
    super.onInit();
  }

  String? adminID;
  String? adminName;
  String? adminEmail;
  String? adminPhone;
  String pageButton = 'approve';
  bool loading = false;
  MyServices myServices = Get.find();
  OrdersData ordersData = OrdersData(crud: Get.find());
  LocaleController localeController = Get.put(LocaleController());
  late String lang;

  List ordersList = [];

  initUserData() {
    adminID = myServices.sharedPreferences.getString('admin_id');
    adminName = myServices.sharedPreferences.getString('admin_username');
    adminEmail = myServices.sharedPreferences.getString('admin_email');
    adminPhone = myServices.sharedPreferences.getString('admin_phone');
  }

  getPendingOrders() async {
    ordersList.clear();
    loading = true;
    pageButton = 'approve';
    update();
    var response = await ordersData.getPendingOrders();
    if (response['status'] == 'success') {
      ordersList = response['ordersview'];
    }
    loading = false;
    update();
  }

  getApprovedOrders() async {
    ordersList.clear();
    loading = true;
    pageButton = 'startprepare';
    update();
    var response = await ordersData.getApprovedOrders();
    if (response['status'] == 'success') {
      ordersList = response['ordersview'];
    }
    loading = false;
    update();
  }

  getInPrepareOrders() async {
    ordersList.clear();
    loading = true;
    pageButton = 'prepared';
    update();
    var response = await ordersData.getPrepareOrders();
    if (response['status'] == 'success') {
      ordersList = response['ordersview'];
    }
    loading = false;
    update();
  }

  getAllOrders() async {
    ordersList.clear();
    loading = true;
    pageButton = 'null';
    update();
    var response = await ordersData.getAllOrders();
    if (response['status'] == 'success') {
      ordersList = response['ordersview'];
    }
    loading = false;
    update();
  }

  approveOrder({required OrderModel orderModel}) async {
    ordersList.removeWhere(
      (element) => element['order_id'] == orderModel.orderId,
    );
    update();
    await ordersData.approveOrder(
      orderId: orderModel.orderId.toString(),
      userId: orderModel.orderUserid.toString(),
    );
  }

  startPrepareOrder({required OrderModel orderModel}) async {
    ordersList.removeWhere(
      (element) => element['order_id'] == orderModel.orderId,
    );
    update();
    await ordersData.startPrepareOrder(
      userId: orderModel.orderUserid.toString(),
      orderId: orderModel.orderId.toString(),
    );
  }

  preparedOrder({required OrderModel orderModel}) async {
    ordersList.removeWhere(
      (element) => element['order_id'] == orderModel.orderId,
    );
    update();
    await ordersData.preparedOrder(
      userId: orderModel.orderUserid.toString(),
      orderId: orderModel.orderId.toString(),
    );
  }
}
