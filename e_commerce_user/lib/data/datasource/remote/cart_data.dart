import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/const/links.dart';

class CartData {
  Crud crud;

  CartData({required this.crud});

  getCoupons() async {
    var res = await crud.getData(
      link: AppLinks.coupons,
    );
    return res.fold((l) => l, (r) => r);
  }

  getData({
    required String userId,
  }) async {
    var res = await crud.getData(
      link: AppLinks.cartView,
      data: {
        'user_id': userId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  insertData({
    required String userId,
    required String itemId,
    required String itemColor,
    required String itemCount,
  }) async {
    var res = await crud.getData(
      link: AppLinks.cartInsert,
      data: {
        'user_id': userId.trim(),
        'item_id': itemId.trim(),
        'item_color': itemColor.trim(),
        'item_count': itemCount.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  deleteData({
    required String userId,
    required String itemId,
  }) async {
    var res = await crud.getData(
      link: AppLinks.cartDelete,
      data: {
        'user_id': userId.trim(),
        'item_id': itemId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  getColor({
    required String userId,
    required String itemId,
  }) async {
    var res = await crud.getData(
      link: AppLinks.getColor,
      data: {
        'user_id': userId.trim(),
        'item_id': itemId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  updateColor({
    required String userId,
    required String itemId,
    required String itemColor,
  }) async {
    var res = await crud.getData(
      link: AppLinks.cartUpdateColor,
      data: {
        'user_id': userId.trim(),
        'item_id': itemId.trim(),
        'item_color': itemColor.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  updateCount({
    required String userId,
    required String itemId,
    required String itemCount,
  }) async {
    var res = await crud.getData(
      link: AppLinks.countEdit,
      data: {
        'user_id': userId.trim(),
        'item_id': itemId.trim(),
        'item_count': itemCount.trim(),
      },
    );

    return res.fold((l) => l, (r) => r);
  }
}
