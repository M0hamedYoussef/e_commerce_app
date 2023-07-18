import 'package:e_commerce_delivery/controller/settings/settings_con.dart';
import 'package:e_commerce_delivery/view/widgets/settings/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsLogout extends GetView<SettingsCon> {
  const SettingsLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingListTile(
      onTap: () {
        controller.logout();
      },
      title: 'logout',
      icon: Icons.logout,
    );
  }
}
