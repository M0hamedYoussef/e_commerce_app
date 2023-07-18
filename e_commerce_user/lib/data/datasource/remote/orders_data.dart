import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/const/links.dart';

class OrdersData {
  Crud crud;

  OrdersData({required this.crud});

  getData({
    required String userId,
  }) async {
    var res = await crud.getData(
      link: AppLinks.ordersView,
      data: {
        'user_id': userId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  getArchiveData({
    required String userId,
  }) async {
    var res = await crud.getData(
      link: AppLinks.ordersArchive,
      data: {
        'user_id': userId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  getOutForDeliveryData({
    required String userId,
  }) async {
    var res = await crud.getData(
      link: AppLinks.ordersInDelivery,
      data: {
        'user_id': userId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  insertData({
    required String userId,
    required String cartId,
    required String itemPrice,
    required String paymentMethod,
    required String addressId,
    required String? coupon,
  }) async {
    var res = await crud.getData(
      link: AppLinks.ordersInsert,
      data: {
        'user_id': userId.trim(),
        'cart_id': cartId.trim(),
        'coupon': coupon?.trim() ?? 'default',
        'item_price': itemPrice.trim(),
        'payment_method': paymentMethod.trim(),
        'address_id': addressId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  deleteData({
    required String userId,
    required String orderId,
  }) async {
    var res = await crud.getData(
      link: AppLinks.ordersCancel,
      data: {
        'user_id': userId.trim(),
        'order_id': orderId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  rateOrder({
    required String userId,
    required String orderId,
    required String orderRate,
  }) async {
    var res = await crud.getData(
      link: AppLinks.ordersRate,
      data: {
        'user_id': userId.trim(),
        'order_id': orderId.trim(),
        'order_rate': orderRate.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }
}
