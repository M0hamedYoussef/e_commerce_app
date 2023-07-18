import 'package:e_commerce/core/class/request_status.dart';
import 'package:e_commerce/core/functions/status_update.dart';
import 'package:e_commerce/core/localization/local_con.dart';
import 'package:e_commerce/data/datasource/remote/search_data.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarCon extends GetxController {
  LocaleController localeController = Get.put(LocaleController());
  SearchData searchData = SearchData(crud: Get.find());
  ValueNotifier<RequsetStatus> requsetStatus =
      ValueNotifier(RequsetStatus.noState);
  bool loading = false;
  String lang = '';
  List searchResult = [];
  int resultsCount = 0;

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
    lang = localeController.locale.toString().contains('ar') ? 'ar' : 'en';
    super.onInit();
  }

  onEditingComplete({required String itemName}) {
    Get.toNamed(AppRoutes.search);
    getData(itemName: itemName);
  }

  getData({
    required String itemName,
  }) async {
    requsetStatus.value = RequsetStatus.loading;
    var response = await searchData.getData(
      itemName: itemName,
    );
    requsetStatus.value = statusUpdater(response: response);
    if (requsetStatus.value == RequsetStatus.success) {
      if (response['status'] == 'success') {
        searchResult = response['itemsview'];
        resultsCount = response['count'];
      }
    }
    update();
  }

  goToDetails({required ItemsModel itemsModel}) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {'itemModel': itemsModel});
  }

  goToNotifications() {
    Get.toNamed(AppRoutes.notifications);
  }

  Future<bool> willPop() {
    searchResult.clear();
    resultsCount = 0;
    Get.back();
    return Future.value(false);
  }
}
