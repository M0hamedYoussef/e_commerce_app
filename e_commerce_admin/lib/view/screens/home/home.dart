import 'package:e_commerce_admin/controller/home_con.dart';
import 'package:e_commerce_admin/core/const/colors.dart';
import 'package:e_commerce_admin/core/const/decoration.dart';
import 'package:e_commerce_admin/view/widgets/auth/global/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminHomeCon());
    return Scaffold(
      appBar: customAppBar(title: 'home_page', backButton: false),
      body: GetBuilder<AdminHomeCon>(
        builder: (controller) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: controller.pages.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.onIconPressed(index: index);
                },
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: AppDecoration().screenHeight * 0.02),
                      Flexible(
                        child: Icon(
                          controller.pages[index]['icon'],
                          size: 50,
                          color: AppColors.blue,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        controller.pages[index]['name'].toString().tr,
                        style: const TextStyle(
                          fontSize: 20,
                          color: AppColors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppDecoration().screenHeight * 0.02),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
