import 'package:e_commerce/controller/settings/settings_con.dart';
import 'package:e_commerce/view/widgets/settings/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsAboutUs extends GetView<SettingsCon> {
  const SettingsAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingListTile(
      onTap: () {
        controller.onAboutUsPressed();
      },
      title: 'about',
      icon: Icons.info_outline_rounded,
    );
  }
}
