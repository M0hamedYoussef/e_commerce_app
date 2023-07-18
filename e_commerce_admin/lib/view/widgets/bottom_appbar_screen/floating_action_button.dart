import 'package:e_commerce_admin/core/const/colors.dart';
import 'package:flutter/material.dart';

class BottomActionButton extends StatelessWidget {
  const BottomActionButton({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      child: FloatingActionButton(
        foregroundColor: AppColors.blue,
        onPressed: onPressed,
        child: const Icon(
          Icons.shopping_cart_outlined,
          color: AppColors.white,
        ),
      ),
    );
  }
}
