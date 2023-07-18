import 'package:e_commerce/core/class/request_status.dart';
import 'package:e_commerce/core/functions/status_update.dart';
import 'package:e_commerce/core/localization/local_con.dart';
import 'package:e_commerce/core/services/my_services.dart';
import 'package:e_commerce/data/datasource/remote/home/home_data.dart';
import 'package:e_commerce/data/model/categories_model.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/data/model/texts_model.dart';
import 'package:e_commerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCon extends GetxController {
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
    getData();
    initUserData();
    lang = localeController.locale.toString().contains('ar') ? 'ar' : 'en';
    super.onInit();
  }

  String? userID;
  String? userName;
  String? userEmail;
  String? userPhone;
  late bool loading;

  HomeData homeData = HomeData(crud: Get.find());
  MyServices myServices = Get.find();
  LocaleController localeController = Get.put(LocaleController());
  ValueNotifier<RequsetStatus> requsetStatus =
      ValueNotifier(RequsetStatus.noState);
  late String lang;

  List categories = [];
  List items = [];
  List<TextModel> texts = [];

  initUserData() {
    userID = myServices.sharedPreferences.getString('user_id');
    userName = myServices.sharedPreferences.getString('user_username');
    userEmail = myServices.sharedPreferences.getString('user_email');
    userPhone = myServices.sharedPreferences.getString('user_phone');
  }

  getData() async {
    items.clear();
    categories.clear();
    requsetStatus.value = RequsetStatus.loading;
    var response = await homeData.getData();
    await getTexts();
    requsetStatus.value = statusUpdater(response: response);
    if (requsetStatus.value == RequsetStatus.success) {
      if (response['status'] == 'success') {
        categories = response['categories'];
        items = response['items'];
      }
    }
  }

  getTexts() async {
    var response = await homeData.getTexts();
    if (response['status'] == 'success') {
      for (var element in response['texts']) {
        texts.add(TextModel.fromJson(element));
      }
      await myServices.sharedPreferences
          .setString('delivery_time_ar', texts[1].textAr!);
      await myServices.sharedPreferences
          .setString('delivery_time_en', texts[1].textEn!);
    }
    // 0 => Home Card,
    // 1 => Delivery Time,
  }

  goToItems({required CategorieModel categorieModel}) {
    int catID = categorieModel.categorieId!;
    String catName = lang == 'en'
        ? categorieModel.categorieNameEn!
        : categorieModel.categorieNameAr!;
    Get.toNamed(
      AppRoutes.items,
      arguments: {
        'cat_id': catID,
        'selected_cat': catName,
        'cat_list': categories,
      },
    );
  }

  goToProductScreen({required ItemsModel itemsModel}) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {'itemModel': itemsModel});
  }
}
