import 'package:e_commerce_admin/core/class/crud.dart';
import 'package:e_commerce_admin/core/const/links.dart';

class LoginData {
  Crud crud;

  LoginData({required this.crud});

  giveData({
    required String email,
    required String password,
  }) async {
      var res = await crud.getData(
        link: AppLinks.login,
        data: {
          'email': email,
          'password': password,
        },
      );
      return res.fold((l) => l, (r) => r);

  }
}
