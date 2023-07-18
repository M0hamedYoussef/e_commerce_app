import 'package:e_commerce_admin/controller/settings/settings_con.dart';
import 'package:e_commerce_admin/view/widgets/settings/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsContactUs extends GetView<SettingsCon> {
  const SettingsContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingListTile(
      onTap: () {
        controller.onConactUsPressed();
      },
      title: 'contact',
      icon: Icons.phone_callback_rounded,
    );
  }
}