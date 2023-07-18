import 'package:e_commerce_admin/view/screens/admin/categories/categorie_add.dart';
import 'package:e_commerce_admin/view/screens/admin/categories/categorie_edit.dart';
import 'package:e_commerce_admin/view/screens/admin/categories/categories_screen.dart';
import 'package:e_commerce_admin/view/screens/admin/items/item_add.dart';
import 'package:e_commerce_admin/view/screens/admin/items/item_edit.dart';
import 'package:e_commerce_admin/view/screens/admin/items/items_screen.dart';
import 'package:e_commerce_admin/view/screens/bottom_appbar_screen/bottom_appbar_screen.dart';
import 'package:e_commerce_admin/view/screens/home/home.dart';
import 'package:e_commerce_admin/view/screens/settings/settings.dart';
import 'package:get/get.dart';
import 'package:e_commerce_admin/core/midleware/midleware.dart';
import 'package:e_commerce_admin/view/screens/auth/forgot_pass/forgot_pass.dart';
import 'package:e_commerce_admin/view/screens/auth/forgot_pass/reset_pass.dart';
import 'package:e_commerce_admin/view/screens/auth/forgot_pass/verify_screen.dart';
import 'package:e_commerce_admin/view/screens/firstscreens/language.dart';
import 'package:e_commerce_admin/view/screens/auth/login.dart';

class AppRoutes {
  static const String lang = '/lang';
  // Auth
  static const String login = '/login';
  static const String forgotPass = '/forgotPass';
  static const String verify = '/verify';
  static const String resetPass = '/resetPass';
  // Home
  static const String home = '/home';
  // Orders
  static const String orders = '/orders';
  // Categories
  static const String categories = '/categories';
  static const String addCategorie = '/addCategorie';
  static const String editCategorie = '/editCategorie';
  //Items
  static const String items = '/items';
  static const String addItem = '/addItems';
  static const String editItem = '/editItems';
  // Settings
  static const String settings = '/settings';
}

List<GetPage<dynamic>>? myRoutes = [
  // First
  GetPage(
    name: AppRoutes.lang,
    page: () => const Language(),
    middlewares: [
      AppMiddleware(),
    ],
  ),
  // Auth
  GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
  GetPage(name: AppRoutes.forgotPass, page: () => const ForgotPassword()),
  GetPage(name: AppRoutes.verify, page: () => const VerifyScreen()),
  GetPage(name: AppRoutes.resetPass, page: () => const ResetPassword()),
  // Home
  GetPage(name: AppRoutes.home, page: () => const AdminHomeScreen()),
  // Orders
  GetPage(name: AppRoutes.orders, page: () => const BottomAppBarScreen()),
  // Categories
  GetPage(name: AppRoutes.categories, page: () => const CategoriesScreen()),
  GetPage(name: AppRoutes.editCategorie, page: () => const CategorieEdit()),
  GetPage(name: AppRoutes.addCategorie, page: () => const CategorieAdd()),
  // Items
  GetPage(name: AppRoutes.items, page: () => const ItemsScreen()),
  GetPage(name: AppRoutes.editItem, page: () => const ItemEdit()),
  GetPage(name: AppRoutes.addItem, page: () => const ItemAdd()),
  // Settings
  GetPage(name: AppRoutes.settings, page: () => const SettingsScreen()),
];
