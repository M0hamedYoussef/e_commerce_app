import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/const/links.dart';

class ItemsData {
  Crud crud;

  ItemsData({required this.crud});

  getData({required int itemCategorieId}) async {
    var res = await crud.getData(
      link: AppLinks.items,
      data: {
        'item_categorie': itemCategorieId.toString(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }
}
