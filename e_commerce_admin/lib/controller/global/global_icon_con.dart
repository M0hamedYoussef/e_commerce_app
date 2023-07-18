import 'package:get/get.dart';

class GlobalIconCon extends GetxController {
  bool iconON = true;
  changeobsc() {
    iconON = !iconON;
    update();
  }
}
