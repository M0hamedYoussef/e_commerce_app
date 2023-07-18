import 'package:e_commerce_delivery/controller/global/global_icon_con.dart';
import 'package:e_commerce_delivery/controller/auth/login_con.dart';
import 'package:e_commerce_delivery/core/const/decoration.dart';
import 'package:e_commerce_delivery/core/functions/check_connection.dart';
import 'package:e_commerce_delivery/core/functions/exit_alert.dart';
import 'package:e_commerce_delivery/view/widgets/auth/global/app_bar.dart';
import 'package:e_commerce_delivery/view/widgets/auth/global/body/custom_listview.dart';
import 'package:e_commerce_delivery/view/widgets/auth/global/forms/email_form.dart';
import 'package:e_commerce_delivery/view/widgets/auth/login/body/custom_row.dart';
import 'package:e_commerce_delivery/view/widgets/auth/global/buttons/custom_button.dart';
import 'package:e_commerce_delivery/view/widgets/auth/global/forms/pass_form.dart';
import 'package:e_commerce_delivery/view/widgets/auth/login/texts/body.dart';
import 'package:e_commerce_delivery/view/widgets/auth/global/body/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    LoginCon loginCon = Get.put(LoginCon());
    GlobalIconCon globalIconCon = Get.put(GlobalIconCon());
    checkInternet();
    return Scaffold(
      appBar: customAppBar(
        title: 'login_title_0',
        backButton: false,
      ),
      body: WillPopScope(
        onWillPop: exitAlert,
        child: CustomListView(
          fst: loginCon.fst,
          children: [
            const CustomTitle(title: 'login_title_1'),
            const LoginBody(),
            SizedBox(height: AppDecoration().screenHeight * .05),
            EmailForm(
              focusNode: loginCon.fstEmailFocus,
              nextNode: loginCon.fstPassFocus,
              emailCon: loginCon.emailCon,
            ),
            SizedBox(height: AppDecoration().screenHeight * .001),
            PassForm(
              focusNode: loginCon.fstPassFocus,
              passCon: loginCon.passCon,
              onEditComplete: () {
                loginCon.login();
              },
              onPressed: () {
                globalIconCon.changeobsc();
              },
            ),
            const LoginCustomRow(),
            SizedBox(height: AppDecoration().screenHeight * .03),
            GlobalCustomButton(
              text: 'login_title_0',
              onPressed: () {
                loginCon.login();
              },
            ),
            SizedBox(height: AppDecoration().screenHeight * .03),
          ],
        ),
      ),
    );
  }
}
