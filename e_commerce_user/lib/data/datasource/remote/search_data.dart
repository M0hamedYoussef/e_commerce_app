import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/const/links.dart';

class SearchData {
  Crud crud;

  SearchData({required this.crud});

  getData({
    required String itemName,
  }) async {
    var res = await crud.getData(
      link: AppLinks.search,
      data: {
        'item_name': itemName.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }
}
