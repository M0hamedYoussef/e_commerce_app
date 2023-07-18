class AppLinks {
  // Main Host
  static const String server = 'http://192.168.1.7/e_commerce_flutter';
  //Folders
  static const String adminFolder = '$server/admin';
  static const String authFolder = '$adminFolder/auth';
  static const String forgotPassFolder = '$authFolder/forgot_pass';
  static const String orderFolder = '$server/admin/orders';
  static const String categoriesFolder = '$server/admin/categories';
  static const String itemsFolder = '$server/admin/items';
//////////////////////////////////////////////////////////////
  // Auth Files
  static const String login = '$authFolder/login.php';
  static const String verify = '$authFolder/verify.php';
  // Forgot Pass Files
  static const String resetPass = '$forgotPassFolder/reset_pass.php';
  static const String forgotPass = '$forgotPassFolder/forgot_pass.php';
  //Images Folders
  static const String itemImagesFolder = '$server/items/images';
  static const String categoriesImagesFolder = '$server/categories/images';
  // Orders Files
  static const String viewPendingOrders = '$orderFolder/orders_view_pending.php';
  static const String viewApprovedOrders = '$orderFolder/orders_view_approved.php';
  static const String viewInPrepareOrders = '$orderFolder/orders_view_inprepare.php';
  static const String viewAllOrders = '$orderFolder/orders_view_all.php';
  static const String approveOrder = '$orderFolder/orders_approval.php';
  static const String startPrepareOrders = '$orderFolder/orders_inprepare.php';
  static const String preparedOrder = '$orderFolder/orders_prepared.php';
  // Admin Categories Files
  static const String categoriesView = '$categoriesFolder/view.php';
  static const String categoriesAdd = '$categoriesFolder/add.php';
  static const String categoriesUpdate = '$categoriesFolder/update.php';
  static const String categoriesDelete = '$categoriesFolder/delete.php';
  // Admin Items Files
  static const String itemsView = '$itemsFolder/view.php';
  static const String itemsAdd = '$itemsFolder/add.php';
  static const String itemsUpdate = '$itemsFolder/update.php';
  static const String itemsDelete = '$itemsFolder/delete.php';
}
