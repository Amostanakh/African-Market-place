import 'package:afyef/src/modules/Home/home.dart';
import 'package:afyef/src/modules/connections/connections.dart';
import 'package:afyef/src/modules/chats/chats.dart';
import 'package:afyef/src/modules/profile/user.profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxInt selectedPage = 0.obs;
  List<Widget> pages = [
    HomeScreen(),
    Connections(),
    AllChats(),
    UserProfile()
  ];

  void changePage(int index) {
    selectedPage.value = index;
  }
}
