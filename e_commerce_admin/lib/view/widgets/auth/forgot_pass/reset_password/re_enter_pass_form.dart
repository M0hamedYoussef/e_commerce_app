import 'package:e_commerce_admin/controller/auth/forgot_pass/resetpass_con.dart';
import 'package:e_commerce_admin/core/const/colors.dart';
import 'package:e_commerce_admin/core/const/decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RePassForm extends StatelessWidget {
  const RePassForm({
    required this.focusNode,
    required this.passCon,
    required this.rePassCon,
    super.key,
    required this.onPressed,
    required this.onEditingComplete,
  });

  final FocusNode focusNode;
  final TextEditingController passCon;
  final TextEditingController rePassCon;
  final void Function()? onPressed;
  final void Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: GetBuilder<ResetPassCon>(
        builder: (con) => TextFormField(
          textDirection: TextDirection.ltr,
          focusNode: focusNode,
          obscureText: con.passeye,
          onEditingComplete: onEditingComplete,
          validator: (value) {
            if (rePassCon.text.trim() != passCon.text.trim()) {
              return "re_pass_valid".tr;
            }
            return null;
          },
          controller: rePassCon,
          decoration: AppDecoration.myinputDecoration(
            label: 'pass',
            hint: 're_pass_hint',
            suffixIcon: IconButton(
              onPressed: onPressed,
              splashColor: AppColors.greySplash,
              splashRadius: 20,
              icon: Icon(
                con.passeye ? Icons.lock_outline : Icons.lock_open,
                color: AppColors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
