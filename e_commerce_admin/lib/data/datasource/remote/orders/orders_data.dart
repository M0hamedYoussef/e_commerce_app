import 'package:e_commerce_admin/core/class/crud.dart';
import 'package:e_commerce_admin/core/const/links.dart';

class OrdersData {
  Crud crud;

  OrdersData({required this.crud});

  getPendingOrders() async {
    var res = await crud.getData(
      link: AppLinks.viewPendingOrders,
    );
    return res.fold((l) => l, (r) => r);
  }

  getApprovedOrders() async {
    var res = await crud.getData(
      link: AppLinks.viewApprovedOrders,
    );
    return res.fold((l) => l, (r) => r);
  }

  getPrepareOrders() async {
    var res = await crud.getData(
      link: AppLinks.viewInPrepareOrders,
    );
    return res.fold((l) => l, (r) => r);
  }

  getAllOrders() async {
    var res = await crud.getData(
      link: AppLinks.viewAllOrders,
    );
    return res.fold((l) => l, (r) => r);
  }

  approveOrder({
    required String userId,
    required String orderId,
  }) async {
    var res = await crud.getData(
      link: AppLinks.approveOrder,
      data: {
        'user_id': userId.trim(),
        'order_id': orderId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  startPrepareOrder({
    required String userId,
    required String orderId,
  }) async {
    var res = await crud.getData(
      link: AppLinks.startPrepareOrders,
      data: {
        'user_id': userId.trim(),
        'order_id': orderId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  preparedOrder({
    required String userId,
    required String orderId,
  }) async {
    var res = await crud.getData(
      link: AppLinks.preparedOrder,
      data: {
        'user_id': userId.trim(),
        'order_id': orderId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }
}
