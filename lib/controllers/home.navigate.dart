import 'package:afyef/controllers/navigation.dart';
import 'package:afyef/src/widget/bottom.Bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navigation extends GetView<NavigationController> {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<NavigationController>(NavigationController());
    return Scaffold(
      body: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          child: controller.pages[controller.selectedPage.value],
        ),
      ),
      bottomNavigationBar: const CustomButtomBar(),
    );
  }
}
