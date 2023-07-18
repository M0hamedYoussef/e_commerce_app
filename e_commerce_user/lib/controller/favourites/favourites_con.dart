import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/services/my_services.dart';
import 'package:e_commerce/data/datasource/remote/favourite_data.dart';
import 'package:e_commerce/data/model/items_model.dart';
import 'package:e_commerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesCon extends GetxController {
  MyServices myServices = Get.find();
  FavouritesData favouritesData = FavouritesData(crud: Get.find());
  bool loading = false;
  String lang = '';
  late List favourites;
  late String userID;
  late String userName;
  late String userEmail;
  late String userPhone;
  late String selectedCat;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    favourites = myServices.favouritesList;
    initUserData();
  }

  initUserData() {
    userID = myServices.sharedPreferences.getString('user_id')!;
    userName = myServices.sharedPreferences.getString('user_username')!;
    userEmail = myServices.sharedPreferences.getString('user_email')!;
    userPhone = myServices.sharedPreferences.getString('user_phone')!;
  }

  deleteData({
    required String userId,
    required String itemId,
  }) async {
    await favouritesData.deleteData(
      userId: userId,
      itemId: itemId,
    );
  }

  insertData({
    required String userId,
    required String itemId,
  }) async {
    await favouritesData.insertData(
      userId: userId,
      itemId: itemId,
    );
  }

  checkProduct({required ItemsModel itemsModel}) {
    bool check = false;

    for (int i = 0; i < favourites.length; i++) {
      if (favourites[i]['item_id'] == itemsModel.itemId) {
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

  remove({required ItemsModel itemsModel}) async {
    deleteData(
      userId: userID,
      itemId: itemsModel.itemId.toString(),
    );
    favourites
        .removeWhere((element) => element['item_id'] == itemsModel.itemId);
    update();
  }

  add({required ItemsModel itemsModel}) async {
    insertData(
      userId: userID,
      itemId: itemsModel.itemId.toString(),
    );
    favourites.add(itemsModel.toJson());
    update();
  }

  onPressed({required ItemsModel itemsModel}) async {
    if (checkProduct(itemsModel: itemsModel) == true) {
      await remove(itemsModel: itemsModel);
    } else if (checkProduct(itemsModel: itemsModel) == false) {
      await add(itemsModel: itemsModel);
    }
  }

  favIcon({required ItemsModel itemsModel}) {
    return Icon(
      checkProduct(itemsModel: itemsModel)
          ? Icons.favorite
          : Icons.favorite_outline,
      color: checkProduct(itemsModel: itemsModel) ? AppColors.blue : null,
    );
  }
}
