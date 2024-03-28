import 'dart:io';
import 'package:afyef/custom.widgets/buttons.all.dart';
import 'package:afyef/custom.widgets/forms.dart';
import 'package:afyef/src/common.dart';
import 'package:afyef/src/config/config.dart';
import 'package:afyef/src/widget/custom_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/authcontoller.dart';

class EditDetailsPage extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    print(firestor.id);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => controller.selectedImage.value == ''
                  ? Column(
                    children: [
                      Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(120)),
                          ),
                          
                                child: GestureDetector(
                                  onTap: () => controller.getImage(),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: SizedBox(
                                          width: 190,
                                          height: 190,
                                          child: ClipOval(
                                            child: Image.asset(
                                              "images/ava.jpeg",
                                            ),
                                          ))),
                                )
                          ),
                       const SizedBox(height: 20,),
                        GestureDetector(
                            onTap: () {
                              controller.getImage();
                            },
                       child:  const Text('Upload Profile Picture',style: TextStyle( color: orange),))
                    ],
                  )
                  : SizedBox(
                      height: 200,
                      width: 300,
                      child: GestureDetector(
                        onTap: () {
                          controller.getImage();
                        },
                        child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: SizedBox(
                                          width: 190,
                                          height: 190,
                                          child: ClipOval(
                                            child: Image.file(
                                File(controller.selectedImage.value))),
                                          ))
                        
                        
                        // Container(
                        //     bottom: 0,
                        //     right: 0,
                        //     height: 35,
                        //     width: 35,
                            // child: Image.file(
                            //     File(controller.selectedImage.value))),
                      ),
                    ),
            ),
            EditTextForm(
              controller: controller.profesionController,
              hintText: "Profession",
            ),
            EditTextForm(
              controller: controller.businessController,
              hintText: 'Business Line',
            ),
            EditTextForm(
                controller: controller.phoneController, hintText: 'Phone '),
            EditTextForm(
                controller: controller.countryController, hintText: 'Country '),

Obx(
                          () => 
                          
                          GestureDetector(
                            onTap:  () async {
                                var connectivityResult =
                                    await (Connectivity().checkConnectivity());
                                final hasInternet =
                                    connectivityResult != ConnectivityResult.none;
                                if (hasInternet) {
                                 
                                 controller.editUserDeatils();
                                } else if (!hasInternet) {
                                  controller.checkStatus();
                                }
                              },
                            child: RegButton(
                              name: controller.isLoading.value
                                  ? const CircularProgress()
                                  : const Center(
                                      child: Text(
                                        'Save',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15.0, color: Colors.white),
                                      ),
                                    ),
                              
                            ),
                          ),
                        ),
          ],
        ),
      ),
    );
  }
}








 