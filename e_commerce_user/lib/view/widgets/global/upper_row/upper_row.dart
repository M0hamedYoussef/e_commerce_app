import 'package:e_commerce/view/widgets/global/upper_row/elements/notification_button.dart';
import 'package:e_commerce/view/widgets/global/upper_row/elements/search_bar.dart';
import 'package:flutter/material.dart';

class UpperRow extends StatelessWidget {
  const UpperRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Row(
        children: const [
          Expanded(
            child: SearchBar(),
          ),
          NotificationButton(),
        ],
      ),
    );
  }
}
