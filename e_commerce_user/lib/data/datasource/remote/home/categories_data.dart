import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/const/links.dart';

class CategoriesData {
  Crud crud;

  CategoriesData({required this.crud});

  getData() async {
    var res = await crud.getData(
      link: AppLinks.categories,

    );
    return res.fold((l) => l, (r) => r);
  }
}
