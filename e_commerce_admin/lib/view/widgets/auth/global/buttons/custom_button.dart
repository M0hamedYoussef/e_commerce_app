import 'package:e_commerce_admin/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalCustomButton extends StatelessWidget {
  const GlobalCustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.blue,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text.tr,
            style: const TextStyle(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
