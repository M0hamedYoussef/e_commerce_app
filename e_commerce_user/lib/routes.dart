import 'package:e_commerce/view/screens/bottom_appbar_screen/bottom_appbar_screen.dart';
import 'package:e_commerce/view/screens/cart/cart_screen.dart';
import 'package:e_commerce/view/screens/cart/checkout_screen.dart';
import 'package:e_commerce/view/screens/items/item_details_screen.dart';
import 'package:e_commerce/view/screens/items/items_screen.dart';
import 'package:e_commerce/view/screens/notifications/notifications_screen.dart';
import 'package:e_commerce/view/screens/orders/order_map.dart';
import 'package:e_commerce/view/screens/orders/orders_archive_screen.dart';
import 'package:e_commerce/view/screens/orders/orders_outfor_delivery.dart';
import 'package:e_commerce/view/screens/search/search_results.dart';
import 'package:e_commerce/view/screens/settings/screens/address/address_add.dart';
import 'package:e_commerce/view/screens/settings/screens/address/address_edit.dart';
import 'package:e_commerce/view/screens/settings/screens/address/address_screen.dart';
import 'package:e_commerce/view/screens/settings/settings.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/midleware/midleware.dart';
import 'package:e_commerce/view/screens/auth/forgot_pass/forgot_pass.dart';
import 'package:e_commerce/view/screens/auth/forgot_pass/reset_pass.dart';
import 'package:e_commerce/view/screens/auth/sign_up/signup.dart';
import 'package:e_commerce/view/screens/auth/forgot_pass/verify_screen.dart';
import 'package:e_commerce/view/screens/auth/sign_up/verify_screen.dart';
import 'package:e_commerce/view/screens/firstscreens/language.dart';
import 'package:e_commerce/view/screens/auth/login.dart';
import 'package:e_commerce/view/screens/firstscreens/on_boarding.dart';

class AppRoutes {
  static const String lang = '/lang';
  static const String onBoarding = '/OnBoarding';
  // Auth
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPass = '/forgotPass';
  static const String verify = '/verify';
  static const String signupVerify = '/signupVerify';
  static const String resetPass = '/resetPass';
  // Home
  static const String home = '/home';
  // Items
  static const String items = '/items';
  static const String itemDetails = '/itemDetails';
  // Settings
  static const String settings = '/settings';
  static const String address = '/address';
  static const String addressAdd = '/addressAdd';
  static const String addressDetails = '/addressDetails';
  // Cart
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  // Orders
  static const String ordersArchive = '/ordersArchive';
  static const String ordersInDelivery = '/ordersInDelivery';
  static const String ordersMap = '/ordersMap';
  // Search
  static const String search = '/search';
  static const String notifications = '/notifications';
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
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),
  // Auth
  GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
  GetPage(name: AppRoutes.signup, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgotPass, page: () => const ForgotPassword()),
  GetPage(name: AppRoutes.verify, page: () => const VerifyScreen()),
  GetPage(name: AppRoutes.signupVerify, page: () => const SignUpVerifyScreen()),
  GetPage(name: AppRoutes.resetPass, page: () => const ResetPassword()),
  // Home
  GetPage(name: AppRoutes.home, page: () => const BottomAppBarScreen()),
  // Items
  GetPage(name: AppRoutes.items, page: () => const ItemsScreen()),
  GetPage(name: AppRoutes.itemDetails, page: () => const ItemDetails()),
  // Setting
  GetPage(name: AppRoutes.settings, page: () => const SettingsScreen()),
  GetPage(name: AppRoutes.address, page: () => const AddressScreen()),
  GetPage(name: AppRoutes.addressAdd, page: () => const AddressAdd()),
  GetPage(name: AppRoutes.addressDetails, page: () => const AddressDetails()),
  // Cart
  GetPage(name: AppRoutes.cart, page: () => const CartScreen()),
  GetPage(name: AppRoutes.checkout, page: () => const CheckoutScreen()),
  // Orders
  GetPage(
    name: AppRoutes.ordersArchive,
    page: () => const OrdersArchiveScreen(),
  ),
  GetPage(
    name: AppRoutes.ordersInDelivery,
    page: () => const OrdersInDeliveryScreen(),
  ),
  GetPage(
    name: AppRoutes.ordersMap,
    page: () => const OrdersMapScreen(),
  ),

  // Search
  GetPage(name: AppRoutes.search, page: () => const SearchResultsScreen()),
  GetPage(
    name: AppRoutes.notifications,
    page: () => const NotificationsScreen(),
  ),
];
