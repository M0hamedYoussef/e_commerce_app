import 'package:e_commerce/controller/cart/cart_controller.dart';
import 'package:e_commerce/core/class/request_status.dart';
import 'package:e_commerce/core/functions/status_update.dart';
import 'package:e_commerce/core/localization/local_con.dart';
import 'package:e_commerce/core/services/my_services.dart';
import 'package:e_commerce/data/datasource/remote/cart_data.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

CartCon _cartCon = Get.put(CartCon());

class ItemDetailsCon extends GetxController {
  MyServices myServices = Get.find();
  CartData cartData = CartData(crud: Get.find());
  LocaleController localeController = Get.put(LocaleController());
  ValueNotifier<String> selectedColor = ValueNotifier('default');
  ValueNotifier<bool> itemInCart = ValueNotifier(false);
  ValueNotifier<RequsetStatus> requsetStatus =
      ValueNotifier(RequsetStatus.noState);
  bool loading = false;
  String? colotArg;
  late String lang;
  late String userID;
  late String userName;
  late String userEmail;
  late String userPhone;
  late String deliveryTimeEn;
  late String deliveryTimeAr;
  late ItemsModel itemModel;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    colotArg = Get.arguments['selectedColor'];
    itemModel = Get.arguments['itemModel'];
    selectedColor.value = colotArg ?? '';
    lang = localeController.locale.toString().contains('ar') ? 'ar' : 'en';
    deliveryTimeAr =
        myServices.sharedPreferences.getString('delivery_time_ar') ?? '';
    deliveryTimeEn =
        myServices.sharedPreferences.getString('delivery_time_en') ?? '';
    initUserData();
    addListeners();
    if (checkInCart(itemModel: itemModel) == true && colotArg == null) {
      await getColor();
    }
  }

  addListeners() {
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
    selectedColor.addListener(
      () {
        if (itemInCart.value == true) {
          itemModel.selectedColor = selectedColor.value.trim();
          for (var element in myServices.cartItems) {
            if (element['item_id'] == itemModel.itemId) {
              element['cart_itemcolor'] = selectedColor.value;
            }
          }
          cartData.updateColor(
            userId: userID,
            itemId: itemModel.itemId.toString(),
            itemColor: selectedColor.value,
          );
        }
      },
    );
  }

  initUserData() {
    userID = myServices.sharedPreferences.getString('user_id')!;
    userName = myServices.sharedPreferences.getString('user_username')!;
    userEmail = myServices.sharedPreferences.getString('user_email')!;
    userPhone = myServices.sharedPreferences.getString('user_phone')!;
  }

  getColor() async {
    requsetStatus.value = RequsetStatus.loading;
    var response = await cartData.getColor(
      userId: userID,
      itemId: itemModel.itemId.toString(),
    );
    requsetStatus.value = statusUpdater(response: response);
    if (response['status'] == 'success') {
      selectedColor.value = response['color'].toString();
      update();
    }
  }

  onColorChanged({required String givedColor, required bool inCart}) {
    itemInCart.value = inCart;
    selectedColor.value = givedColor;
    update();
  }

  checkInCart({required ItemsModel itemModel}) {
    itemInCart.value = _cartCon.checkProductCart(itemsModel: itemModel);
    return itemInCart.value;
  }
}
