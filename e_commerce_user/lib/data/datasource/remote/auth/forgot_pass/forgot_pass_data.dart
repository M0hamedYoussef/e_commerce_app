import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/const/links.dart';

class ForgotPassData {
  Crud crud;

  ForgotPassData({required this.crud});

  giveData({
    required String email,
  }) async {
    var res = await crud.getData(
      link: AppLinks.forgotPass,
      data: {
        'email': email,
      },
    );
    return res.fold((l) => l, (r) => r);
  }
}
