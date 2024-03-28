import 'package:afyef/controllers/home.navigate.dart';
import 'package:afyef/src/modules/edit.details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class UserManagement {
  storeNewUser(user, context) async {
    User? currentFirebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentFirebaseUser?.uid)
        .set({'email': user.email, 'uid': user.uid, 'books': []}).then(
            (value) => Get.to(() =>  EditDetailsPage()));

    //.catchError((e) {});
  }


  editprofile(userdata, context) async {
    User? currentFirebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentFirebaseUser?.uid)
        .set({"Phone": userdata.phoneController,
      "Country": userdata.countryController,
      "businessLine":userdata.businessController,
      "profession":userdata.profesionController,
      "UserDiscription":userdata.userdiscriptionController}).then(
            (value) {
              print('data saved successfully');
            });

    //.catchError((e) {});
  }
  
}
