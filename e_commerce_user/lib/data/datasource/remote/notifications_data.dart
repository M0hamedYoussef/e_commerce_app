import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/const/links.dart';

class NotificationsData {
  Crud crud;

  NotificationsData({required this.crud});

  getData({
    required String userId,
  }) async {
    var res = await crud.getData(
      link: AppLinks.notificationsView,
      data: {
        'user_id': userId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }
}
