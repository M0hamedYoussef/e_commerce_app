import 'dart:io';
import 'package:e_commerce_admin/core/const/colors.dart';
import 'package:e_commerce_admin/core/localization/local_con.dart';
import 'package:e_commerce_admin/core/services/my_services.dart';
import 'package:e_commerce_admin/data/datasource/remote/categories/categories_data.dart';
import 'package:e_commerce_admin/data/model/categories/categories_mode.dart';
import 'package:e_commerce_admin/routes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesCon extends GetxController {
  @override
  onInit() async {
    initUserData();
    lang = localeController.locale.toString().contains('ar') ? 'ar' : 'en';
    loading = true;
    update();
    await getCategories();
    loading = false;
    update();
    super.onInit();
  }

  MyServices myServices = Get.find();
  CategoriesData categoriesData = CategoriesData(crud: Get.find());
  LocaleController localeController = Get.put(LocaleController());
  String? deliveryID;
  String? deliveryName;
  String? deliveryEmail;
  String? deliveryPhone;
  XFile? image;
  GlobalKey<FormState> fst = GlobalKey();
  TextEditingController categorieNameEn = TextEditingController();
  TextEditingController categorieNameAr = TextEditingController();
  FocusNode categorieEnFocus = FocusNode();
  FocusNode categorieArFocus = FocusNode();
  bool loading = false;
  List categoriesList = [];
  late CategoriesModel selectedCategorie;
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

  addCategorie() async {
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
        await categoriesData.addCategorie(
          img: File(image!.path),
          categorieNameEn: categorieNameEn.text,
          categorieNameAr: categorieNameAr.text,
        );
        Get.back();
        loading = true;
        update();
        await getCategories();
        loading = false;
        update();
      }
    }
  }

  pickImage() async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  editCategorie() async {
    if (fst.currentState!.validate() &&
        (selectedCategorie.categorieNameAr != categorieNameAr.text ||
            selectedCategorie.categorieNameEn != categorieNameEn.text ||
            image != null)) {
      if (image == null) {
        Get.back();
        loading = true;
        update();
        await categoriesData.editCategorie(
          categorieId: selectedCategorie.categorieId.toString(),
          oldImageName: '',
          categorieNameAr: categorieNameAr.text,
          categorieNameEn: categorieNameEn.text,
        );
        await getCategories();
        loading = false;
        update();
      } else {
        Get.back();
        loading = true;
        update();
        await categoriesData.editCategorie(
          categorieId: selectedCategorie.categorieId.toString(),
          oldImageName: selectedCategorie.categorieImage!,
          img: File(image!.path),
          categorieNameAr: categorieNameAr.text,
          categorieNameEn: categorieNameEn.text,
        );
        await getCategories();
        loading = false;
        update();
      }
    } else {
      Get.back();
    }
  }

  deleteCategorie() async {
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
            categoriesList.removeWhere((element) =>
                element['categorie_id'] == selectedCategorie.categorieId);
            update();
            await categoriesData.deleteCategorie(
              categorieId: selectedCategorie.categorieId.toString(),
              categorieImg: selectedCategorie.categorieImage.toString(),
            );
            getCategories();
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

  goToCategorieDetails({required CategoriesModel categoriesModel}) {
    selectedCategorie = categoriesModel;
    categorieNameEn.text = selectedCategorie.categorieNameEn!;
    categorieNameAr.text = selectedCategorie.categorieNameAr!;
    image = null;
    Get.toNamed(AppRoutes.editCategorie);
  }
}
