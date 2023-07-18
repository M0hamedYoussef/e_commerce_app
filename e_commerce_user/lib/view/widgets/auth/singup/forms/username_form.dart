import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUserForm extends StatelessWidget {
  const SignUserForm(
      {required this.focusNode, required this.userCon, super.key, required this.nextNode});

  final FocusNode focusNode;
  final FocusNode nextNode;
  final TextEditingController userCon;

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
          if (value!.isEmpty == true) {
            return 'user_valid_0'.tr;
          } else if (value.length < 4) {
            return 'user_valid_1'.tr;
          }
          return null;
        },
        controller: userCon,
        decoration: AppDecoration.myinputDecoration(
          label: 'user_label',
          hint: 'user_hint',
          suffixIcon: const Icon(
            Icons.person_outline,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
