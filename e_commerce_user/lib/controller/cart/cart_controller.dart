import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/localization/local_con.dart';
import 'package:e_commerce/core/services/my_services.dart';
import 'package:e_commerce/data/datasource/remote/cart_data.dart';
import 'package:e_commerce/data/model/coupons_model.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCon extends GetxController {
  MyServices myServices = Get.find();
  LocaleController localeController = Get.put(LocaleController());
  CartData cartData = CartData(crud: Get.find());
  double price = 0;
  double priceWithDiscount = 0;
  bool loading = false;
  bool couponWorks = false;
  bool couponLoading = false;

  double discountCoupon = 0;

  String lang = '';
  late String userID;
  late String userName;
  late String userEmail;
  late String userPhone;
  late String selectedCat;
  late List coupons;
  CouponsModel? globalCouponModel;
  TextEditingController couponCon = TextEditingController();
  FocusNode couponFieldFocus = FocusNode();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    coupons = myServices.coupons;
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

  insertData({
    required String userId,
    required String itemId,
    required String itemColor,
    required String itemCount,
  }) async {
    await cartData.insertData(
      userId: userId,
      itemId: itemId,
      itemColor: itemColor,
      itemCount: itemCount,
    );
  }

  getData() async {
    loading = true;
    update();
    myServices.cartItems.clear();
    await myServices.getCartItems(userId: userID);
    priceCalculate();
    loading = false;
    update();
  }

  deleteData({
    required String userId,
    required String itemId,
  }) async {
    await cartData.deleteData(
      userId: userId,
      itemId: itemId,
    );
  }

  priceCalculate() async {
    price = 0;
    priceWithDiscount = 0;

    if (myServices.cartItems.length > 1) {
      for (var element in myServices.cartItems) {
        ItemsModel itemsModel = ItemsModel.fromJson(element);
        price =
            price + (itemsModel.cartItemcount! * itemsModel.priceWithDiscount!);
      }
      if (couponWorks == true) {
        priceWithDiscount = price - discountCoupon;
      } else {
        priceWithDiscount = price;
      }
    } else if (myServices.cartItems.length == 1) {
      ItemsModel itemsModel = ItemsModel.fromJson(myServices.cartItems[0]);
      price =
          price + (itemsModel.cartItemcount! * itemsModel.priceWithDiscount!);
      if (couponWorks == true) {
        priceWithDiscount = price - discountCoupon;
      } else {
        priceWithDiscount = price;
      }
    }
    update();
  }

  checkProductCart({
    required ItemsModel itemsModel,
  }) {
    dynamic check = false;
    for (int i = 0; i < myServices.cartItems.length; i++) {
      if (myServices.cartItems[i]['item_id'] == itemsModel.itemId) {
        check = true;
        break;
      } else {
        check = false;
      }
    }
    return check;
  }

  goToDetails({required ItemsModel itemsModel}) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {'itemModel': itemsModel});
  }

  removeFromCart({required ItemsModel itemsModel}) async {
    deleteData(
      userId: userID,
      itemId: itemsModel.itemId.toString(),
    );
    myServices.cartItems
        .removeWhere((element) => element['item_id'] == itemsModel.itemId);
    priceCalculate();
  }

  addToCart({
    required ItemsModel itemsModel,
  }) async {
    insertData(
      userId: userID,
      itemId: itemsModel.itemId.toString(),
      itemColor: itemsModel.selectedColor!,
      itemCount: itemsModel.cartItemcount.toString(),
    );
    myServices.cartItems.add(itemsModel.toJson());
    priceCalculate();
  }

  onPressed({required ItemsModel itemsModel}) {
    if (checkProductCart(itemsModel: itemsModel) == true) {
      removeFromCart(itemsModel: itemsModel);
    } else if (checkProductCart(itemsModel: itemsModel) == false) {
      addToCart(itemsModel: itemsModel);
    }
  }

  cartIcon({required ItemsModel itemsModel}) {
    return Icon(
      checkProductCart(itemsModel: itemsModel) == true
          ? Icons.remove_shopping_cart_outlined
          : Icons.add_shopping_cart_outlined,
      color: AppColors.white,
      size: 24,
    );
  }

  updateItemCount({
    required ItemsModel itemModel,
  }) async {
    cartData.updateCount(
      userId: userID,
      itemId: itemModel.itemId.toString(),
      itemCount: itemModel.cartItemcount.toString(),
    );
    priceCalculate();
  }

  onCouponPressed() async {
    couponLoading = true;
    update();
    await myServices.getCoupons();
    coupons = myServices.coupons;
    couponLoading = false;

    update();
    String myCoupon = couponCon.text.trim().toLowerCase();
    if (coupons.isNotEmpty && myCoupon.isNotEmpty) {
      for (int i = 0; i < coupons.length; i++) {
        CouponsModel couponsModel = CouponsModel.fromJson(coupons[i]);
        if (couponsModel.coupon == myCoupon) {
          globalCouponModel = couponsModel;
          couponWorks = true;
          discountCoupon = couponsModel.couponDiscount ?? 0;
          priceCalculate();
          break;
        } else {
          globalCouponModel = null;
          couponWorks = false;
          priceCalculate();
        }
      }
    } else {
      globalCouponModel = null;
      couponWorks = false;
      priceCalculate();
    }
  }

  onPlaceOrder() {
    Get.toNamed(
      AppRoutes.checkout,
      arguments: {
        'couponModel': globalCouponModel,
        'price': price,
        'couponDiscount': discountCoupon,
      },
    );
  }
}
