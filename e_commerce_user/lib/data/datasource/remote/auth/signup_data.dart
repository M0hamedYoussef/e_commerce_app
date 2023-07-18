import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/const/links.dart';

class SignUpData {
  Crud crud;

  SignUpData({required this.crud});

  giveData({
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    var res = await crud.getData(
      link: AppLinks.signup,
      data: {
        'username': username,
        'email': email,
        'phone': phone,
        'password': password,
      },
    );
    return res.fold((l) => l, (r) => r);
  }
}
