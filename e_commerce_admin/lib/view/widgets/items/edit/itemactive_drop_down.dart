import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_commerce_admin/controller/admin/items_con.dart';
import 'package:e_commerce_admin/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActiveItemEditDropDown extends StatelessWidget {
  const ActiveItemEditDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsCon>(
      builder: (controller) => Container(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'active'.tr,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 18,
                height: 0.5,
                fontWeight: FontWeight.w400,
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 1,
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 0,
                    child: Text(
                      '0',
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
                value: controller.selectedItem.itemActive,
                onChanged: (value) {
                  controller.selectedItem.itemActive = value;
                  controller.update();
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  width: 160,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    color: Colors.blue,
                  ),
                  elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 14,
                  iconEnabledColor: AppColors.white,
                  iconDisabledColor: AppColors.white,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.blue,
                  ),
                  offset: const Offset(-20, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all<double>(6),
                    thumbVisibility: MaterialStateProperty.all<bool>(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
