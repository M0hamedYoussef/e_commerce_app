import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.editingController,
    required this.focusNode,
    required this.nextFocusNode,
    required this.hint,
    this.lang = 'en',
    this.isNumber = false,
  });
  final String hint;
  final String lang;
  final bool isNumber;
  final TextEditingController editingController;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint.tr,
        ),
        controller: editingController,
        focusNode: focusNode,
        onEditingComplete: () {
          nextFocusNode.requestFocus();
        },
        textDirection: lang == 'en' ? TextDirection.ltr : TextDirection.rtl,
        validator: (value) {
          if (value.toString().isEmpty) {
            return "empty".tr;
          }
          return null;
        },
      ),
    );
  }
}
