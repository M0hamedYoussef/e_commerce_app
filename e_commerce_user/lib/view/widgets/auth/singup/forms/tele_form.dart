import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignTeleForm extends StatelessWidget {
  const SignTeleForm(
      {required this.focusNode,
      required this.teleCon,
      super.key,
      required this.nextNode});

  final FocusNode focusNode;
  final FocusNode nextNode;
  final TextEditingController teleCon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 13),
      child: TextFormField(
        textDirection: TextDirection.ltr,
        focusNode: focusNode,
        onEditingComplete: () {
          nextNode.canRequestFocus = true;
          nextNode.requestFocus();
        },
        validator: (value) {
          if (!GetUtils.isPhoneNumber(value!)) {
            return "tele_valid".tr;
          }
          return null;
        },
        controller: teleCon,
        keyboardType: TextInputType.number,
        decoration: AppDecoration.myinputDecoration(
          label: 'tele_label',
          hint: 'tele_hint',
          suffixIcon: const Icon(
            Icons.phone_outlined,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
