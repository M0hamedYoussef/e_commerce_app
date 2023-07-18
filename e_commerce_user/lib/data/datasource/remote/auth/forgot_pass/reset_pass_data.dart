import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/const/links.dart';

class ResetPassData {
  Crud crud;

  ResetPassData({required this.crud});

  giveData({
    required String email,
    required String password,
  }) async {
    var res = await crud.getData(
      link: AppLinks.resetPass,
      data: {
        'email': email,
        'password': password,
      },
    );
    return res.fold((l) => l, (r) => r);
  }
}
