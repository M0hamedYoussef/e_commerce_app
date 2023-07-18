import 'package:e_commerce_admin/controller/global/global_icon_con.dart';
import 'package:get/get.dart';

GlobalIconCon _globalIconCon = Get.put(GlobalIconCon());
Future<bool> passEYE() {
  _globalIconCon.iconON = true;
  _globalIconCon.update();
  Get.back();
  return Future.value(false);
}
