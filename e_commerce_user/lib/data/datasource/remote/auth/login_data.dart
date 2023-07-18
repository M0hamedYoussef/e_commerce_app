import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/const/links.dart';

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
