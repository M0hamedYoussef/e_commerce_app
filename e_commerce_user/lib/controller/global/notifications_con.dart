import 'package:e_commerce/core/localization/local_con.dart';
import 'package:e_commerce/core/services/my_services.dart';
import 'package:e_commerce/data/datasource/remote/notifications_data.dart';
import 'package:get/get.dart';

class NotificationsCon extends GetxController {
  LocaleController localeController = Get.put(LocaleController());
  MyServices myServices = Get.find();
  NotificationsData notificationsData = NotificationsData(crud: Get.find());
  bool loading = false;
  String lang = '';
  late String userID;
  late String userName;
  late String userEmail;
  late String userPhone;

  @override
  void onInit() {
    lang = localeController.locale.toString().contains('ar') ? 'ar' : 'en';
    initUserData();
    super.onInit();
  }

  initUserData() {
    userID = myServices.sharedPreferences.getString('user_id')!;
    userName = myServices.sharedPreferences.getString('user_username')!;
    userEmail = myServices.sharedPreferences.getString('user_email')!;
    userPhone = myServices.sharedPreferences.getString('user_phone')!;
  }

  getData() async {
    loading = true;
    update();
    await myServices.getNotifications(userId: userID);
    loading = false;
    update();
  }
}
