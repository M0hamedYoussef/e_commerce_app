import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/const/links.dart';

class FavouritesData {
  Crud crud;

  FavouritesData({required this.crud});

  getData({
    required String userId,
  }) async {
    var res = await crud.getData(
      link: AppLinks.favouriteView,
      data: {
        'user_id': userId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  insertData({
    required String userId,
    required String itemId,
  }) async {
    var res = await crud.getData(
      link: AppLinks.favouriteInsert,
      data: {
        'user_id': userId.trim(),
        'item_id': itemId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  deleteData({
    required String userId,
    required String itemId,
  }) async {
    var res = await crud.getData(
      link: AppLinks.favouriteDelete,
      data: {
        'user_id': userId.trim(),
        'item_id': itemId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }
}
