import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/navigation.dart';

class CustomButtomBar extends GetView<NavigationController> {
  const CustomButtomBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(AuthenticationController());
    Get.lazyPut(() => NavigationController());
    return Obx(
      () => BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.amber.shade800,
        currentIndex: controller.selectedPage.value,
        onTap: (value) => controller.changePage(value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.connected_tv_sharp),
            label: 'Connections',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
