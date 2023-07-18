class AppLinks {
  // Main Host
  static const String server = 'http://192.168.1.3/e_commerce_flutter';
  //Folders
  static const String authFolder = '$server/user/auth';
  static const String forgotPassFolder = '$authFolder/forgot_pass';
  //
  static const String itemsFolder = '$server/items';
  static const String itemImagesFolder = '$server/items/images';
  //
  static const String categoriesFolder = '$server/categories';
  static const String categoriesImagesFolder = '$server/categories/images';
  //
  static const String favouriteFolder = '$server/user/favourites';
  static const String searchFolder = '$server/user/search';
  //
  static const String cartFolder = '$server/user/cart';
  static const String colorFolder = '$server/user/cart/color';
  static const String countFolder = '$server/user/cart/count';
  //
  static const String addressFolder = '$server/user/address';
  //
  static const String ordersFolder = '$server/user/orders';
  //
  static const String notificationsFolder = '$server/user/notifications';
  ////////////////////////////////
  // Test File
  static const String testPhp = '$server/test.php';
  // Auth Files
  static const String login = '$authFolder/login.php';
  static const String signup = '$authFolder/signup.php';
  static const String verify = '$authFolder/verify.php';
  // Forgot Pass Files
  static const String resetPass = '$forgotPassFolder/reset_pass.php';
  static const String forgotPass = '$forgotPassFolder/forgot_pass.php';
  // Categories File
  static const String categories = '$categoriesFolder/categories.php';
  // Items File
  static const String items = '$itemsFolder/items.php';
  // Home File
  static const String home = '$server/homePage.php';
  static const String texts = '$server/texts.php';
  // Favoutite
  static const String favouriteView = '$favouriteFolder/view.php';
  static const String favouriteInsert = '$favouriteFolder/insert.php';
  static const String favouriteDelete = '$favouriteFolder/delete.php';
  //////////////
  // Cart
  static const String coupons = '$cartFolder/coupons.php';
  static const String cartView = '$cartFolder/view.php';
  static const String cartInsert = '$cartFolder/insert.php';
  static const String cartDelete = '$cartFolder/delete.php';
  // Cart Item Color
  static const String cartUpdateColor = '$colorFolder/cart_update_color.php';
  static const String getColor = '$colorFolder/get_color.php';
  // Cart Item Count
  static const String countEdit = '$countFolder/cart_item_count.php';
  //////////////
  // Search
  static const String search = '$searchFolder/search.php';
  // Address
  static const String addressView = '$addressFolder/view.php';
  static const String addressInsert = '$addressFolder/insert.php';
  static const String addressUpdate = '$addressFolder/update.php';
  static const String addressDelete = '$addressFolder/delete.php';
  // Orders && Checkout
  static const String ordersView = '$ordersFolder/view.php';
  static const String ordersArchive = '$ordersFolder/archive.php';
  static const String ordersInDelivery = '$ordersFolder/indelivery.php';
  static const String ordersInsert = '$ordersFolder/insert.php';
  static const String ordersCancel = '$ordersFolder/delete.php';
  static const String ordersRate = '$ordersFolder/rate.php';
  //
  static const String notificationsView = '$notificationsFolder/view.php';
}
