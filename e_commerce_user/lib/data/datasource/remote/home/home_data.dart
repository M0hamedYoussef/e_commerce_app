import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/const/links.dart';

class HomeData {
  Crud crud;

  HomeData({required this.crud});

  getData() async {
    var res = await crud.getData(
      link: AppLinks.home,
    );
    return res.fold((l) => l, (r) => r);
  }

  getTexts() async {
    var res = await crud.getData(
      link: AppLinks.texts,
    );
    return res.fold((l) => l, (r) => r);
  }
}
