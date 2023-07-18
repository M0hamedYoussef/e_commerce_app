import 'package:e_commerce/core/class/request_status.dart';
import 'package:e_commerce/core/functions/status_update.dart';
import 'package:e_commerce/core/localization/local_con.dart';
import 'package:e_commerce/core/services/my_services.dart';
import 'package:e_commerce/data/datasource/remote/home/items_data.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsCon extends GetxController {
  MyServices myServices = Get.find();
  LocaleController localeController = Get.put(LocaleController());
  ItemsData itemsData = ItemsData(crud: Get.find());
  ValueNotifier<RequsetStatus> requsetStatus =
      ValueNotifier(RequsetStatus.noState);
  List items = [];
  bool loading = false;
  String lang = '';
  late String userID;
  late String userName;
  late String userEmail;
  late String userPhone;
  late String selectedCat;
  late List categories;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() {
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

    getData(catID: Get.arguments['cat_id']);
    initUserData();
    selectedCat = Get.arguments['selected_cat'];
    categories = Get.arguments['cat_list'];
    lang = localeController.locale.toString().contains('ar') ? 'ar' : 'en';
  }

  initUserData() {
    userID = myServices.sharedPreferences.getString('user_id')!;
    userName = myServices.sharedPreferences.getString('user_username')!;
    userEmail = myServices.sharedPreferences.getString('user_email')!;
    userPhone = myServices.sharedPreferences.getString('user_phone')!;
  }

  getData({required int catID}) async {
    requsetStatus.value = RequsetStatus.loading;
    var response = await itemsData.getData(itemCategorieId: catID);
    requsetStatus.value = await statusUpdater(response: response);
    if (requsetStatus.value == RequsetStatus.success) {
      if (response['status'] == 'success') {
        items.clear();
        items.addAll(response['itemsview']);
      } else {
        items.clear();
      }
    }
    update();
  }

  changeCat({required index}) async {
    selectedCat = categories[index]['categorie_name_$lang'];
    await getData(catID: categories[index]['categorie_id']);
  }

  goToDetails({required ItemsModel itemsModel}) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {'itemModel': itemsModel});
  }
}
