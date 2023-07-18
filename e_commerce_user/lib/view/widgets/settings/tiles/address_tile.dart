import 'package:e_commerce/controller/settings/settings_con.dart';
import 'package:e_commerce/view/widgets/settings/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsAddress extends GetView<SettingsCon> {
  const SettingsAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingListTile(
      onTap: () {
        controller.onAddressPressed();
      },
      title: 'addresses',
      icon: Icons.location_on_outlined,
    );
  }
}
