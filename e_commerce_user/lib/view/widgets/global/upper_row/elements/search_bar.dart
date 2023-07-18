import 'package:e_commerce/controller/global/lang_con.dart';
import 'package:e_commerce/controller/global/search_bar_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBar extends GetView<SearchBarCon> {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode fstSearchFocus = FocusNode();
    final TextEditingController searchCon = TextEditingController();
    Get.put(LangCon());
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.greyDesign,
          borderRadius: BorderRadius.circular(10),
        ),
        child: GetBuilder<LangCon>(
          builder: (langCon) => TextFormField(
            textDirection: langCon.langTextField == 'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
            focusNode: fstSearchFocus,
            controller: searchCon,
            onTapOutside: (_) {
              fstSearchFocus.unfocus();
            },
            onEditingComplete: () {
              controller.onEditingComplete(itemName: searchCon.text);
            },
            onChanged: (value) {
              if (value.length == 1) {
                langCon.checkLang(value);
                langCon.update();
              }
            },
            decoration: InputDecoration(
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 9, horizontal: 27),
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.search),
              hintText: 'search_hint'.tr,
              hintStyle: const TextStyle(
                fontSize: 15,
                fontFamily: 'Cairo',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
