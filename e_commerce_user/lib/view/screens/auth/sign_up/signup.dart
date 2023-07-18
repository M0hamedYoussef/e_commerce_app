import 'package:e_commerce/controller/global/global_icon_con.dart';
import 'package:e_commerce/controller/auth/sign_up/signup_con.dart';
import 'package:e_commerce/core/const/decoration.dart';
import 'package:e_commerce/core/functions/passeye_lock.dart';
import 'package:e_commerce/view/widgets/auth/global/buttons/custom_button.dart';
import 'package:e_commerce/view/widgets/auth/global/body/custom_listview.dart';
import 'package:e_commerce/view/widgets/auth/global/app_bar.dart';
import 'package:e_commerce/view/widgets/auth/global/forms/email_form.dart';
import 'package:e_commerce/view/widgets/auth/global/forms/pass_form.dart';
import 'package:e_commerce/view/widgets/auth/singup/forms/tele_form.dart';
import 'package:e_commerce/view/widgets/auth/singup/forms/username_form.dart';
import 'package:e_commerce/view/widgets/auth/global/body/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpCon signUpCon = Get.put(SignUpCon());
    GlobalIconCon globalIconCon = Get.put(GlobalIconCon());
    return Scaffold(
      appBar: customAppBar(
        title: 'signup',
        back: false,
        onPressed: () {
          passEYE();
        },
      ),
      body: WillPopScope(
        onWillPop: passEYE,
        child: CustomListView(
          fst: signUpCon.fst,
          children: [
            const CustomTitle(title: 'signup_title'),
            SizedBox(height: AppDecoration().screenHeight * .1),
            SignUserForm(
              focusNode: signUpCon.fstUserFocus,
              nextNode: signUpCon.fstTeleFocus,
              userCon: signUpCon.userCon,
            ),
            SizedBox(height: AppDecoration().screenHeight * .001),
            SignTeleForm(
              focusNode: signUpCon.fstTeleFocus,
              nextNode: signUpCon.fstEmailFocus,
              teleCon: signUpCon.teleCon,
            ),
            SizedBox(height: AppDecoration().screenHeight * .001),
            EmailForm(
              focusNode: signUpCon.fstEmailFocus,
              nextNode: signUpCon.fstPassFocus,
              emailCon: signUpCon.emailCon,
            ),
            SizedBox(height: AppDecoration().screenHeight * .001),
            PassForm(
              focusNode: signUpCon.fstPassFocus,
              passCon: signUpCon.passCon,
              onEditComplete: () {
                signUpCon.signUp();
              },
              onPressed: () {
                globalIconCon.changeobsc();
              },
            ),
            SizedBox(height: AppDecoration().screenHeight * .03),
            GlobalCustomButton(
              text: 'signup',
              onPressed: () {
                signUpCon.signUp();
              },
            ),
            SizedBox(height: AppDecoration().screenHeight * .03),
          ],
        ),
      ),
    );
  }
}
