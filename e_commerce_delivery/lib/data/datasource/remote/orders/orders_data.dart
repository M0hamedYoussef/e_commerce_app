import 'package:e_commerce_delivery/core/class/crud.dart';
import 'package:e_commerce_delivery/core/const/links.dart';

class OrdersData {
  Crud crud;

  OrdersData({required this.crud});

  getPreparedOrderd() async {
    var res = await crud.getData(
      link: AppLinks.preparedOrders,
    );
    return res.fold((l) => l, (r) => r);
  }

  getAcceptedOrders({
    required String deliveryId,
  }) async {
    var res = await crud.getData(
      link: AppLinks.acceptedOrders,
      data: {
        'delivery_id': deliveryId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  deliveredOrder({
    required String userId,
    required String createdDate,
  }) async {
    var res = await crud.getData(
      link: AppLinks.completeOrder,
      data: {
        'user_id': userId.trim(),
        'order_createddate': createdDate.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  approveOrder({
    required String userId,
    required String deliveryId,
    required String createdDate,
  }) async {
    var res = await crud.getData(
      link: AppLinks.approveOrder,
      data: {
        'user_id': userId.trim(),
        'delivery_id': deliveryId.trim(),
        'order_createddate': createdDate.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }
}
