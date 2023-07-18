import 'package:e_commerce_admin/controller/settings/settings_con.dart';
import 'package:e_commerce_admin/view/widgets/settings/tiles/logout_tile.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_admin/core/const/decoration.dart';
import 'package:e_commerce_admin/view/widgets/settings/tiles/aboutus_tile.dart';
import 'package:e_commerce_admin/view/widgets/settings/tiles/contactus_tile.dart';
import 'package:e_commerce_admin/view/widgets/settings/tiles/lang_tile.dart';
import 'package:e_commerce_admin/view/widgets/settings/upper_stack.dart';
import 'package:get/get.dart';

class SettingsListView extends StatelessWidget {
  const SettingsListView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsCon());
    
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const SettingStack(),
        SizedBox(height: AppDecoration().screenHeight * .08),
        const SettingsAboutUs(),
        const SettingsContactUs(),
        const SettingsChangeLang(),
        const SettingsLogout(),
      ],
    );
  }
}
