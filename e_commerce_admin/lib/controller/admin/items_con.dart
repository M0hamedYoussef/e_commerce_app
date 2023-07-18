import 'dart:io';
import 'package:e_commerce_admin/core/const/colors.dart';
import 'package:e_commerce_admin/core/localization/local_con.dart';
import 'package:e_commerce_admin/core/services/my_services.dart';
import 'package:e_commerce_admin/data/datasource/remote/Items/Items_data.dart';
import 'package:e_commerce_admin/data/model/items/items_model.dart';
import 'package:e_commerce_admin/data/datasource/remote/categories/categories_data.dart';
import 'package:e_commerce_admin/routes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsCon extends GetxController {
  @override
  onInit() async {
    initUserData();
    lang = localeController.locale.toString().contains('ar') ? 'ar' : 'en';
    loading = true;
    update();
    await getItems();
    await getCategories();
    loading = false;
    update();
    super.onInit();
  }

  addInit() {
    addItemActive = '1';
    addItemCategorieId = categoriesList[0]['categorie_id'].toString();
  }

  MyServices myServices = Get.find();
  ItemsData itemsData = ItemsData(crud: Get.find());
  CategoriesData categoriesData = CategoriesData(crud: Get.find());
  LocaleController localeController = Get.put(LocaleController());
  String? deliveryID;
  String? deliveryName;
  String? deliveryEmail;
  String? deliveryPhone;
  XFile? image;
  GlobalKey<FormState> fst = GlobalKey();
  TextEditingController itemNameEn = TextEditingController();
  TextEditingController itemNameAr = TextEditingController();
  TextEditingController itemDescEn = TextEditingController();
  TextEditingController itemDescAr = TextEditingController();
  TextEditingController itemPrice = TextEditingController();
  TextEditingController itemCount = TextEditingController();
  TextEditingController itemDiscount = TextEditingController();
  TextEditingController itemColors = TextEditingController();
  FocusNode itemNameEnFocus = FocusNode();
  FocusNode itemNameArFocus = FocusNode();
  FocusNode itemDescEnFocus = FocusNode();
  FocusNode itemDescArFocus = FocusNode();
  FocusNode itemPriceFocus = FocusNode();
  FocusNode itemCountFocus = FocusNode();
  FocusNode itemDiscountFocus = FocusNode();
  FocusNode itemColorsFocus = FocusNode();
  bool loading = false;
  List itemsList = [];
  List categoriesList = [];
  late String addItemActive;
  late String addItemCategorieId;
  late ItemsModel selectedItem;
  late String lang;

  initUserData() {
    deliveryID = myServices.sharedPreferences.getString('delivery_id');
    deliveryName = myServices.sharedPreferences.getString('delivery_username');
    deliveryEmail = myServices.sharedPreferences.getString('delivery_email');
    deliveryPhone = myServices.sharedPreferences.getString('delivery_phone');
  }

  getCategories() async {
    categoriesList.clear();
    var response = await categoriesData.getCategories();
    if (response['status'] == 'success') {
      categoriesList = response['categories'];
    }
  }

  getItems() async {
    itemsList.clear();
    var response = await itemsData.getItems();
    if (response['status'] == 'success') {
      itemsList = response['items'];
    }
  }

  addItem() async {
    if (fst.currentState!.validate()) {
      if (image == null) {
        Get.defaultDialog(
          title: 'exit_alert_title'.tr,
          middleText: 'image_null_alert'.tr,
          titleStyle: const TextStyle(
            color: AppColors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
          ),
          middleTextStyle: const TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Cairo',
          ),
        );
      } else {
        await itemsData.addItem(
          img: File(image!.path),
          itemCategorie: addItemCategorieId,
          itemActive: addItemActive,
          itemsNameEn: itemNameEn.text,
          itemsNameAr: itemNameAr.text,
          itemDescEn: itemDescEn.text,
          itemDescAr: itemDescAr.text,
          itemPrice: itemPrice.text,
          itemDiscount: itemDiscount.text,
          itemColors: itemColors.text,
          itemCount: itemCount.text,
        );
        Get.back();
        loading = true;
        update();
        await getItems();
        loading = false;
        update();
      }
    }
  }

  pickImage() async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  editItem() async {
    if (fst.currentState!.validate()) {
      if (image == null) {
        Get.back();
        loading = true;
        update();
        await itemsData.editItem(
          oldImageName: '',
          itemActive: selectedItem.itemActive.toString(),
          itemCategorie: selectedItem.itemCategorie.toString(),
          itemId: selectedItem.itemId.toString(),
          itemsNameEn: itemNameEn.text,
          itemsNameAr: itemNameAr.text,
          itemDescEn: itemDescEn.text,
          itemDescAr: itemDescAr.text,
          itemPrice: itemPrice.text,
          itemDiscount: itemDiscount.text,
          itemColors: itemColors.text,
          itemCount: itemCount.text,
        );
        await getItems();
        loading = false;
        update();
      } else {
        Get.back();
        loading = true;
        update();
        await itemsData.editItem(
          itemActive: selectedItem.itemActive.toString(),
          itemCategorie: selectedItem.itemCategorie.toString(),
          oldImageName: selectedItem.itemImage!,
          itemId: selectedItem.itemId.toString(),
          img: File(image!.path),
          itemsNameEn: itemNameEn.text,
          itemsNameAr: itemNameAr.text,
          itemDescEn: itemDescEn.text,
          itemDescAr: itemDescAr.text,
          itemPrice: itemPrice.text,
          itemDiscount: itemDiscount.text,
          itemColors: itemColors.text,
          itemCount: itemCount.text,
        );
        await getItems();
        loading = false;
        update();
      }
    }
  }

  deleteItem() async {
    Get.defaultDialog(
      title: 'alert'.tr,
      middleText: 'sure_alert'.tr,
      titleStyle: const TextStyle(
        color: AppColors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontFamily: 'Cairo',
      ),
      middleTextStyle: const TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Cairo',
      ),
      actions: [
        MaterialButton(
          onPressed: () async {
            Get.back();
            Get.back();
            itemsList.removeWhere(
              (element) => element['item_id'] == selectedItem.itemId,
            );
            update();
            await itemsData.deleteItem(
              itemId: selectedItem.itemId.toString(),
              img: selectedItem.itemImage.toString(),
            );
          },
          color: AppColors.blue,
          child: Text(
            'yes'.tr,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            Get.back();
          },
          color: AppColors.blue,
          child: Text(
            'no'.tr,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
          ),
        ),
      ],
    );
  }

  goToItemDetails({required ItemsModel itemsModel}) {
    clearTexts();
    setTexts(itemsModel: itemsModel);
    Get.toNamed(AppRoutes.editItem);
  }

  goToAddItem() {
    clearTexts();
    Get.toNamed(AppRoutes.addItem);
  }

  setTexts({required ItemsModel itemsModel}) {
    selectedItem = itemsModel;
    itemNameEn.text = selectedItem.itemNameEn!;
    itemNameAr.text = selectedItem.itemNameAr!;
    itemDescAr.text = selectedItem.itemDescAr!;
    itemDescEn.text = selectedItem.itemDescEn!;
    itemPrice.text = selectedItem.itemPrice.toString();
    itemCount.text = selectedItem.itemCount.toString();
    itemColors.text = selectedItem.itemColors.toString();
  }

  clearTexts() {
    itemNameEn.clear();
    itemNameAr.clear();
    itemDescAr.clear();
    itemDescEn.clear();
    itemPrice.clear();
    itemCount.clear();
    itemColors.clear();
    image = null;
  }
}
