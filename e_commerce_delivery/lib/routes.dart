import 'package:e_commerce_delivery/view/screens/bottom_appbar_screen/bottom_appbar_screen.dart';
import 'package:e_commerce_delivery/view/screens/orders/order_details_screen.dart';
import 'package:get/get.dart';
import 'package:e_commerce_delivery/core/midleware/midleware.dart';
import 'package:e_commerce_delivery/view/screens/auth/forgot_pass/forgot_pass.dart';
import 'package:e_commerce_delivery/view/screens/auth/forgot_pass/reset_pass.dart';
import 'package:e_commerce_delivery/view/screens/auth/forgot_pass/verify_screen.dart';
import 'package:e_commerce_delivery/view/screens/firstscreens/language.dart';
import 'package:e_commerce_delivery/view/screens/auth/login.dart';

class AppRoutes {
  static const String lang = '/lang';
  // Auth
  static const String login = '/login';
  static const String forgotPass = '/forgotPass';
  static const String verify = '/verify';
  static const String resetPass = '/resetPass';
  // Home
  static const String home = '/home';
  static const String orderdetails = '/orderdetails';
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
  // Home
  GetPage(name: AppRoutes.home, page: () => const BottomAppBarScreen()),
  // Auth
  GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
  GetPage(name: AppRoutes.forgotPass, page: () => const ForgotPassword()),
  GetPage(name: AppRoutes.verify, page: () => const VerifyScreen()),
  GetPage(name: AppRoutes.resetPass, page: () => const ResetPassword()),
  //
  GetPage(name: AppRoutes.orderdetails, page: () => const OrderDetailsScreen()),
];
