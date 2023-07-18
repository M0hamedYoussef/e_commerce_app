import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/const/links.dart';

class AddressData {
  Crud crud;

  AddressData({required this.crud});

  getData({
    required String userId,
  }) async {
    var res = await crud.getData(
      link: AppLinks.addressView,
      data: {
        'user_id': userId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  insertData({
    required String userId,
    required String userPhone,
    required String city,
    required String street,
    required String name,
    required String lat,
    required String long,
  }) async {
    var res = await crud.getData(
      link: AppLinks.addressInsert,
      data: {
        'user_id': userId.trim(),
        'user_phonenumber': userPhone.trim(),
        'address_city': city.trim(),
        'address_street': street.trim(),
        'address_name': name.trim(),
        'address_lat': lat.trim(),
        'address_long': long.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  updateData({
    required String userId,
    required String userPhone,
    required String addressId,
    required String city,
    required String street,
    required String name,
    required String lat,
    required String long,
  }) async {
    var res = await crud.getData(
      link: AppLinks.addressUpdate,
      data: {
        'user_id': userId.trim(),
        'user_phonenumber': userPhone.trim(),
        'address_id': addressId.trim(),
        'address_city': city.trim(),
        'address_street': street.trim(),
        'address_name': name.trim(),
        'address_lat': lat.trim(),
        'address_long': long.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  deleteData({
    required String userId,
    required String addressId,
  }) async {
    var res = await crud.getData(
      link: AppLinks.addressDelete,
      data: {
        'user_id': userId.trim(),
        'address_id': addressId.trim(),
      },
    );
    return res.fold((l) => l, (r) => r);
  }
}
