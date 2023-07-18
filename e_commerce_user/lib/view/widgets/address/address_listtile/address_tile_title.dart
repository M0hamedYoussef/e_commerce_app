import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:flutter/material.dart';

class AddressTileTitle extends StatelessWidget {
  const AddressTileTitle({super.key, required this.addressModel});
  final AddressModel addressModel;
  @override
  Widget build(BuildContext context) {
    return Text(
      addressModel.addressName.toString(),
      style: const TextStyle(
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w400,
        fontSize: 17,
        color: AppColors.black,
      ),
    );
  }
}
