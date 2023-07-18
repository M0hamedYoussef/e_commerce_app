import 'package:e_commerce/controller/home/home_con.dart';
import 'package:e_commerce/core/localization/local_con.dart';
import 'package:e_commerce/core/services/my_services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:e_commerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

HomeCon _homeCon = Get.put(HomeCon());

class SettingsCon extends GetxController {
  MyServices myServices = Get.find();
  LocaleController localeController = Get.put(LocaleController());
  late String lang;
  String? userID;
  String? userName;
  String? userEmail;
  String? userPhone;

  @override
  void onInit() {
    initUserData();
    lang = localeController.locale.toString();
    super.onInit();
  }

  initUserData() {
    userID = myServices.sharedPreferences.getString('user_id');
    userName = myServices.sharedPreferences.getString('user_username');
    userEmail = myServices.sharedPreferences.getString('user_email');
    userPhone = myServices.sharedPreferences.getString('user_phone');
  }

  onAboutUsPressed() {}

  onAddressPressed() {
    Get.toNamed(AppRoutes.address);
  }

  onArchivePressed() {
    Get.toNamed(AppRoutes.ordersArchive);
  }

  onConactUsPressed() async {
    String url = 'tel:xxxxxxxxxxx';
    await launchUrl(
      Uri.parse(url),
      mode: url.contains('http')
          ? LaunchMode.inAppWebView
          : LaunchMode.platformDefault,
    );
  }

  changeLang() async {
    if (lang.contains('en')) {
      lang = 'ar';
      await myServices.sharedPreferences.setString('lang', 'ar');
      localeController.locale = const Locale('ar');
      _homeCon.onInit();
      Get.updateLocale(localeController.locale!);
    } else if (lang.contains('ar')) {
      lang = 'en';
      await myServices.sharedPreferences.setString('lang', 'en');
      localeController.locale = const Locale('en');
      _homeCon.onInit();
      Get.updateLocale(localeController.locale!);
    }
  }

  logout() async {
    await myServices.sharedPreferences.clear();
    await myServices.sharedPreferences.setBool('OnboardingSkip', true);
    if (lang.contains('ar')) {
      await myServices.sharedPreferences.setString('lang', 'ar');
    } else {
      await myServices.sharedPreferences.setString('lang', 'en');
    }
    Get.offAllNamed(AppRoutes.login);
  }
}
