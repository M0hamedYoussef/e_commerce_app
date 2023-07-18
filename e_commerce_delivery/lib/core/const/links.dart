class AppLinks {
  // Main Host
  static const String server = 'http://192.168.1.7/e_commerce_flutter';
  //Folders
  static const String authFolder = '$server/delivery/auth';
  static const String forgotPassFolder = '$authFolder/forgot_pass';
  static const String ordersFolder = '$server/delivery/orders';
  static const String ordersViewFolder = '$server/delivery/orders/view';
//////////////////////////////////////////////////////////////
  // Auth Files
  static const String login = '$authFolder/login.php';
  static const String verify = '$authFolder/verify.php';
  // Forgot Pass Files
  static const String resetPass = '$forgotPassFolder/reset_pass.php';
  static const String forgotPass = '$forgotPassFolder/forgot_pass.php';
  // Orders Files
  static const String approveOrder = '$ordersFolder/orders_approval.php';
  static const String completeOrder = '$ordersFolder/order_delivered.php';
  static const String preparedOrders = '$ordersViewFolder/orders_prepared_view.php';
  static const String acceptedOrders = '$ordersViewFolder/orders_accepted_view.php';


}
