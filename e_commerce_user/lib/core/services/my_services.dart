import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/functions/check_connection.dart';
import 'package:e_commerce/data/datasource/remote/address_data.dart';
import 'package:e_commerce/data/datasource/remote/cart_data.dart';
import 'package:e_commerce/data/datasource/remote/favourite_data.dart';
import 'package:e_commerce/data/datasource/remote/notifications_data.dart';
import 'package:e_commerce/data/datasource/remote/orders_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  late List coupons = [];
  late List cartItems = [];
  late List addressesList = [];
  late List favouritesList = [];
  late List ordersList = [];
  late List notifications = [];
  late int notificationsCount = 0;
  late Position currentPosition;
  CartData cartData = CartData(crud: Get.put(Crud()));
  FavouritesData favouritesData = FavouritesData(crud: Get.find());
  AddressData addressData = AddressData(crud: Get.find());
  OrdersData ordersData = OrdersData(crud: Get.find());
  NotificationsData notificationsData = NotificationsData(crud: Get.find());

  getCartItems({required String userId}) async {
    var response = await cartData.getData(userId: userId);
    if (response['status'] == 'success') {
      cartItems = response['data'];
    }

    return response;
  }

  getCoupons() async {
    var response = await cartData.getCoupons();

    if (response['status'] == 'success') {
      coupons = response['data'];
    } else {
      coupons.clear();
    }

    return response;
  }

  getAddresses({required String userId}) async {
    var response = await addressData.getData(userId: userId);
    if (response['status'] == 'success') {
      addressesList = response['data'];
    }
    return response;
  }

  getFavourites({
    required String userId,
  }) async {
    var response = await favouritesData.getData(
      userId: userId,
    );
    if (response['status'] == 'success') {
      favouritesList = response['data'];
    }
  }

  getOrders({
    required String userId,
  }) async {
    var response = await ordersData.getData(
      userId: userId,
    );
    if (response['status'] == 'success') {
      ordersList = response['ordersview'];
    }
  }

  getArchivedOrders({
    required String userId,
  }) async {
    var response = await ordersData.getArchiveData(
      userId: userId,
    );
    if (response['status'] == 'success') {
      ordersList = response['ordersview'];
    }
  }

  getNotifications({
    required String userId,
  }) async {
    var response = await notificationsData.getData(
      userId: userId,
    );
    if (response['status'] == 'success') {
      notifications = response['notifications'];
      notificationsCount = response['count'];
    }
  }

  Future<MyServices> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    sharedPreferences = await SharedPreferences.getInstance();
    String? userID = sharedPreferences.getString('user_id');
    if (userID != null && await checkInternet() == true) {
      await getCartItems(userId: userID);
      await getAddresses(userId: userID);
      await getFavourites(userId: userID);
      await getOrders(userId: userID);
      await getNotifications(userId: userID);
      await getCoupons();
    }
    return this;
  }
}

initService() async {
  await Get.putAsync(() => MyServices().init());
}
