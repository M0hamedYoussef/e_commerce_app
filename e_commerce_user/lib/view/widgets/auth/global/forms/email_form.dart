import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailForm extends StatelessWidget {
  const EmailForm({
    required this.focusNode,
    required this.emailCon,
    super.key,
    this.nextNode,
    this.onEditingComplete,
  });

  final FocusNode focusNode;
  final FocusNode? nextNode;
  final Function()? onEditingComplete;
  final TextEditingController emailCon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 13),
      child: TextFormField(
        textDirection: TextDirection.ltr,
        focusNode: focusNode,
        keyboardType: TextInputType.emailAddress,
        onEditingComplete: () {
          if (nextNode != null) {
            nextNode!.canRequestFocus = true;
            nextNode!.requestFocus();
          }
          if (onEditingComplete != null) {
            onEditingComplete!();
          }
        },
        validator: (value) {
          if (value!.isEmpty == true) {
            return 'email_valid_0'.tr;
          } else if (value.contains('.') == false ||
              value.contains('@') == false ||
              value.length < 4) {
            return "email_valid_1".tr;
          }
          return null;
        },
        controller: emailCon,
        decoration: AppDecoration.myinputDecoration(
          label: 'email',
          hint: 'email_hint',
          suffixIcon: const Icon(
            Icons.email_outlined,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
