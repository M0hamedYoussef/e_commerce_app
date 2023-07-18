import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class SettingListTile extends StatelessWidget {
  const SettingListTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });
  final void Function() onTap;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          title: Text(
            title.tr,
            style: const TextStyle(
              fontFamily: 'Cairo',
            ),
          ),
          trailing: Icon(icon),
        ),
      ),
    );
  }
}
