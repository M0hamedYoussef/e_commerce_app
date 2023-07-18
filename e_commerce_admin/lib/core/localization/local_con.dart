import 'package:e_commerce_admin/core/functions/location.dart';
import 'package:e_commerce_admin/core/services/my_services.dart';
import 'package:e_commerce_admin/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  MyServices myServices = Get.find();
  Locale? locale;

  @override
  onInit() async {
    locale = myServices.sharedPreferences.getString('lang') == null
        ? Get.deviceLocale
        : Locale(myServices.sharedPreferences.getString('lang')!);
    getLocation();
    super.onInit();
  }

  change(String lang) {
    if (lang == 'Ar') {
      myServices.sharedPreferences.setString('lang', 'ar');
      locale = const Locale('ar');
    } else {
      myServices.sharedPreferences.setString('lang', 'en');
      locale = const Locale('en');
    }
    Get.offNamed(AppRoutes.login);
    Get.updateLocale(Locale(myServices.sharedPreferences.getString('lang')!));
  }
}
