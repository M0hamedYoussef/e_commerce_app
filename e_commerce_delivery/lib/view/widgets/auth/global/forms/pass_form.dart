import 'package:e_commerce_delivery/controller/global/global_icon_con.dart';
import 'package:e_commerce_delivery/core/const/colors.dart';
import 'package:e_commerce_delivery/core/const/decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassForm extends StatelessWidget {
  const PassForm({
    required this.focusNode,
    required this.passCon,
    super.key,
    required this.onPressed,
    this.nextNode,
    this.onEditComplete,
  });

  final FocusNode focusNode;
  final FocusNode? nextNode;
  final TextEditingController passCon;
  final void Function()? onPressed;
  final void Function()? onEditComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 13),
      child: GetBuilder<GlobalIconCon>(
        builder: (con) => TextFormField(
          textDirection: TextDirection.ltr,
          focusNode: focusNode,
          obscureText: con.iconON,
          onEditingComplete: () {
            if (nextNode != null) {
              nextNode!.canRequestFocus = true;
              nextNode!.requestFocus();
            }
            if (onEditComplete != null) {
              onEditComplete!();
            }
          },
          validator: (value) {
            if (value!.isEmpty == true) {
              return "pass_valid_0".tr;
            } else if (value.length < 10) {
              return "pass_valid_1".tr;
            }
            return null;
          },
          controller: passCon,
          decoration: AppDecoration.myinputDecoration(
            label: 'pass',
            hint: 'pass_hint',
            suffixIcon: IconButton(
              onPressed: onPressed,
              splashColor: AppColors.greySplash,
              splashRadius: 20,
              icon: Icon(
                con.iconON ? Icons.lock_outline : Icons.lock_open,
                color: AppColors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
