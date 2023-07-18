import 'package:get/get.dart';

class SuccessScreenCon extends GetxController {
  late String name;

  toNamedFun({required String toNamed}) {
    name = toNamed;
    getToNamed();
  }

  getToNamed() {
    Get.offAllNamed(name);
  }
}
