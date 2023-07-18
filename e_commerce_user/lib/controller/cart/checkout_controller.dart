import 'package:e_commerce/core/localization/local_con.dart';
import 'package:e_commerce/core/services/my_services.dart';
import 'package:e_commerce/data/datasource/remote/cart_data.dart';
import 'package:e_commerce/data/datasource/remote/orders_data.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:e_commerce/data/model/coupons_model.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/routes.dart';
import 'package:e_commerce/view/screens/success_screen.dart';
import 'package:get/get.dart';

class CheckoutCon extends GetxController {
  MyServices myServices = Get.find();
  OrdersData ordersData = OrdersData(crud: Get.find());
  CartData cartData = CartData(crud: Get.find());
  LocaleController localeController = Get.put(LocaleController());
  late List addressesList;
  late String lang;
  late double price;
  late double priceWithDiscount;
  late double totalPrice;
  late double discountCoupon;
  late List cartItems;
  late String userID;
  late String userName;
  late String userEmail;
  late String userPhone;
  late String method;
  late String? selectedAddress;
  late AddressModel? selectedAddressModel;
  CouponsModel? couponsModel;

  List<String> paymentMethodsList = [
    'Cash',
    'Visa',
  ];

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    cartItems = myServices.cartItems;
    lang = localeController.locale.toString();
    price = Get.arguments['price'];
    discountCoupon = Get.arguments['couponDiscount'];
    couponsModel = Get.arguments['couponModel'];
    priceWithDiscount = price - discountCoupon;
    totalPrice = priceWithDiscount + 200;
    addressesList = myServices.addressesList;
    method = 'Cash';
    selectedAddress =
        addressesList.isNotEmpty ? addressesList[0]['address_name'] : null;
    selectedAddressModel = addressesList.isNotEmpty
        ? AddressModel.fromJson(addressesList[0])
        : null;
    initUserData();
  }

  initUserData() {
    userID = myServices.sharedPreferences.getString('user_id')!;
    userName = myServices.sharedPreferences.getString('user_username')!;
    userEmail = myServices.sharedPreferences.getString('user_email')!;
    userPhone = myServices.sharedPreferences.getString('user_phone')!;
  }

  changePaymentMethod({required String newMethod}) {
    method = newMethod;
    update();
  }

  changeAddress({required AddressModel addressModel}) {
    selectedAddress = addressModel.addressName!;
    selectedAddressModel = addressModel;
    update();
  }

  goToAddresses() {
    Get.offNamed(AppRoutes.address);
  }

  finishOrder() async {
    if (addressesList.isNotEmpty) {
      for (var element in cartItems) {
        ItemsModel orderModel = ItemsModel.fromJson(element);
        await ordersData.insertData(
          userId: userID,
          cartId: orderModel.cartId.toString(),
          addressId: selectedAddressModel!.addressId.toString(),
          itemPrice: orderModel.itemPrice.toString(),
          paymentMethod: method,
          coupon: couponsModel?.coupon ?? 'default',
        );
      }
      myServices.cartItems.clear();
      await myServices.getOrders(userId: userID);
      await myServices.getCartItems(userId: userID);

      Get.offAll(
        () => SuccessScreen(
          toNamed: AppRoutes.home,
          buttonText: 'goto_home'.tr,
        ),
      );
    } else {
      goToAddresses();
      Get.rawSnackbar(title: 'alert'.tr, message: 'add_address_alert'.tr);
    }
  }
}
