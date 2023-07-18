import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/const/links.dart';

class TestData {
  Crud crud;

  TestData({required this.crud});

  getData() async {
    var res =
        await crud.getData(link: AppLinks.testPhp, data: {'test': 'Done'});
    return res.fold((l) => l, (r) => r);
  }
}
