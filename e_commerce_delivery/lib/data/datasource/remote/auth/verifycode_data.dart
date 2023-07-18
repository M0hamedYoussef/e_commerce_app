import 'package:e_commerce_delivery/core/class/crud.dart';
import 'package:e_commerce_delivery/core/const/links.dart';

class VerifyCodeData {
  Crud crud;

  VerifyCodeData({required this.crud});

  getData({
    required String email,
    required String code,
  }) async {
    var res = await crud.getData(link: AppLinks.verify, data: {
      'email': email,
      'verifycode': code,
    });
    return res.fold((l) => l, (r) => r);
  }
}
