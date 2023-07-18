import 'package:e_commerce/controller/global/search_bar_con.dart';
import 'package:get/get.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchBarCon());
  }
}
