import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class AddressTileSubtitle extends StatelessWidget {
  const AddressTileSubtitle({super.key, required this.addressModel});
  final AddressModel addressModel;
  @override
  Widget build(BuildContext context) {
    String address =
        '${addressModel.addressCity} : ${addressModel.addressStreet}';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          address,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w400,
            fontSize: 15,
            height: 1,
            color: AppColors.grey,
          ),
        ),
        Text(
          '${'phone'.tr} : ${addressModel.userPhonenumber}',
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w400,
            fontSize: 15,
            height: 1.2,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
