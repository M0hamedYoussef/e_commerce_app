import 'package:e_commerce_admin/binding/init_bind.dart';
import 'package:e_commerce_admin/core/localization/local_con.dart';
import 'package:e_commerce_admin/core/localization/localize.dart';
import 'package:e_commerce_admin/core/services/my_services.dart';
import 'package:e_commerce_admin/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslations(),
      locale: localeController.locale,
      debugShowCheckedModeBanner: false,
      getPages: myRoutes,
      initialBinding: InitBindings(),
      initialRoute: AppRoutes.lang,
    );
  }
}