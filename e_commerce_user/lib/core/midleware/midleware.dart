import 'package:e_commerce/core/services/my_services.dart';
import 'package:e_commerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppMiddleware extends GetMiddleware {
  MyServices myServices = Get.find();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getBool('LoginSkip') == true) {
      return const RouteSettings(name: AppRoutes.home);
    }
    if (myServices.sharedPreferences.getBool('OnboardingSkip') == true) {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
