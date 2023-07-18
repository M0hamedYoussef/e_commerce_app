import 'package:e_commerce/view/widgets/firstscreens/language/custom_lang_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose Language'.tr,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const CustomLangButton(lang: 'Ar'),
            const CustomLangButton(lang: 'En'),
          ],
        ),
      ),
    );
  }
}
