import 'package:e_commerce_delivery/binding/init_bind.dart';
import 'package:e_commerce_delivery/core/localization/local_con.dart';
import 'package:e_commerce_delivery/core/localization/localize.dart';
import 'package:e_commerce_delivery/core/services/my_services.dart';
import 'package:e_commerce_delivery/routes.dart';
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
