import 'package:afyef/src/modules/connections/search.country.dart';
import 'package:afyef/src/modules/Authentication/siginin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../src/modules/anouncement.dart';

Widget myDrawer() {
  return Drawer(
    child: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Profile"),
                    onTap: () {
                      Get.to(AnnouncementPage(
                          message: 'John Doe', title: 'johndoe@gmail.com'));
                      // My Pfofile button action
                    }),
                ListTile(
                    leading: const Icon(Icons.announcement),
                    title: const Text("Anouncements"),
                    onTap: () {
                      Get.to(AnnouncementPage(
                          message: 'Wecome', title: 'Can we go'));
                      // My Pfofile button action
                    }),
                ListTile(
                    leading: const Icon(Icons.sell),
                    title: const Text("Purchase"),
                    onTap: () {
                      // My Pfofile button action
                    }),

                ListTile(
                    leading: const Icon(Icons.search),
                    title: const Text("Search Country"),
                    onTap: () {
                      Get.to(SearchCountry(
                          message: 'Messeges',
                          title: 'Events coming 20/11/23'));
                      // Find peoples button action
                    }),

                ListTile(
                    leading: const Icon(Icons.message),
                    title: const Text("Chats"),
                    onTap: () {
                      // Home button action
                    }),

                ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text("Signout"),
                    onTap: () {
                      Get.to( LoginPage());
                      // My Pfofile button action
                    }),

                //add more drawer menu here
              ],
            ))),
  );
}
