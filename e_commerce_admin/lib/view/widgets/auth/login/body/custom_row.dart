import 'package:e_commerce_admin/view/widgets/auth/login/customrowElements/checkbox.dart';
import 'package:e_commerce_admin/view/widgets/auth/login/customrowElements/forgot_pass.dart';
import 'package:flutter/material.dart';

class LoginCustomRow extends StatelessWidget {
  const LoginCustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          LoginCheckBox(),
          LoginForgotPass(),
        ],
      ),
    );
  }
}
