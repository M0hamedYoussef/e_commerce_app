import 'package:e_commerce/controller/address/address_con.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:e_commerce/view/widgets/address/address_listtile/address_tile_subtitle.dart';
import 'package:e_commerce/view/widgets/address/address_listtile/address_tile_title.dart';
import 'package:e_commerce/view/widgets/address/handling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddressCon controller = Get.put(AddressCon());

    return AddressScreenHandling(
      itemBuilder: (context, index) {
        AddressModel addressModel =
            AddressModel.fromJson(controller.addressesList[index]);
        return ListTile(
          onTap: () {
            controller.goToDetails(addressModel: addressModel);
          },
          title: AddressTileTitle(addressModel: addressModel),
          subtitle: AddressTileSubtitle(addressModel: addressModel),
        );
      },
    );
  }
}
