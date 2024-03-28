import 'dart:io';
import 'package:afyef/controllers/home.navigate.dart';
import 'package:afyef/controllers/usermanagement.dart';
import 'package:afyef/src/config/config.dart';
import 'package:afyef/src/models/newuser.model.dart';
import 'package:afyef/src/modules/Authentication/siginin.dart';
import 'package:afyef/src/modules/edit.details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class AuthenticationController extends GetxController {
  GetStorage getStorage = GetStorage();
  RxBool isPasswordHidden = true.obs;
  RxString selectedImage = ''.obs;
  RxInt counter = 0.obs;
  RxBool isLoading = false.obs;
  Map<String, dynamic> data = {};
  String connectionStatus = '...........';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController businessController = TextEditingController();
  TextEditingController profesionController = TextEditingController();
  RxBool stringResponse = false.obs;
 
Future<void> getImage() async {
  final result = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (result != null) {
selectedImage.value = result.path;
  } else {
    Get.snackbar('Error', 'Problem Occured');
  }
}
  void signup(BuildContext context) {
    isLoading.value = true;
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    )
        .then((signedInUser) async {
      data = {
        "email": signedInUser.user!.email,
        "uid": signedInUser.user!.uid,
      };
      await getStorage.write("user", data);
   

      Get.to(EditDetailsPage());
      // kUser.value = UserModel.fromJson(data);

      // ignore: use_build_context_synchronously
      UserManagement().storeNewUser(signedInUser.user, context);

     isLoading.value = false;
    }).catchError((e) {
      Get.defaultDialog(
        title: "Alert!",
        content: const Text("Email or password error, try again"),
        actions: [
          TextButton(
            child: const Text("ok"),
            onPressed: () => Get.back(),
          ),
        ],
      );
      isLoading.value = false;
    });
  }

  void login() {
    isLoading.value = true;

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((signedInUser) async {
      data = {
        "email": signedInUser.user!.email,
        "uid": signedInUser.user!.uid,
      };

      await getStorage.write("user", data);

      // kUser.value = UserModel.fromJson(data);

      Get.offAll(() => const Navigation());
    }).catchError((e) {
      Get.defaultDialog(
        title: "Alert!",
        content: const Text("Email or password error, try again"),
        actions: [
          TextButton(
            child: const Text("ok"),
            onPressed: () => Get.back(),
          ),
        ],
      );
      isLoading.value = false;
    });
  }

  void forgetpassword() async {
    isLoading.value = true;
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.sendPasswordResetEmail(email: emailController.text);
      isLoading.value = false;
      Get.snackbar(
          'Email Successfully reseted', 'Open email to finish verication');
    } catch (e) {
      Get.snackbar('Try Again', 'Email does not exist');
    }
  }

  signOut() {
    isLoading.value = true;
    getStorage.erase();
    FirebaseAuth.instance.signOut().then((value) => {
      Get.offAll( LoginPage())
    });
    isLoading.value = false;
  }

  delete() async {
    User? currentFirebaseUser = FirebaseAuth.instance.currentUser;
    if (currentFirebaseUser != null) {
      currentFirebaseUser.delete().then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(currentFirebaseUser.uid)
            .delete();
        Get.snackbar('Alert', 'Account has been deleted Succefully');
        // Get.offAll(const LoginScreen());
        // Get.defaultDialog(
        //     title: "Alert",
        //     content: const Text(
        //         "Are you sure you want to delete your account, you will not be able to recover it"),
        //     actions: [
        //       TextButton(
        //           child: const Text("OK"),
        //           onPressed: () => Get.offAll(const LoginScreen()))
        //     ]);
        // Get.snackbar('Account', 'Succesfully deleted');
        // getStorage.erase();
        // Get.offAll(() => const LoginScreen());
        // }).catchError((e) {
        //   Get.defaultDialog(
        //     title: "Alert",
        //     content: const Text(
        //         "Delete account failure try to correct email or your paqssword"),
        //     actions: [
        //       TextButton(
        //         child: const Text("OK"),
        //         onPressed: () => Get.back(),
        //       ),
        //     ],
        //   );
      });
    }
  }


  Future<void> editUserDeatils() async {
    isLoading.value = true;
    DateTime now =  DateTime.now();
DateTime date =  DateTime(now.year, now.month, now.day);
     File file = File(selectedImage.value);
      var snapshot = await FirebaseStorage.instance
          .ref('Profile Picture/${DateTime.now().millisecondsSinceEpoch}')
          .putFile(file);
      var url = await snapshot.ref.getDownloadURL();
    User? currentFirebaseUser = FirebaseAuth.instance.currentUser;
    final firestor = FirebaseFirestore.instance
        .collection('users')
        .doc(currentFirebaseUser?.uid);
    await firestor.update({
      "Phone": phoneController.text,
      "Country": countryController.text,
      "businessLine": businessController.text,
      "profession": profesionController.text,
       "profilePicture": url,
       "dateJoined": date,
       "friend":[],
       "requests":[],
    }).then((value) async {
      Get.snackbar('Succefully', 'Data Saved');
      isLoading.value = false;
      await Get.to(const Navigation());
    }).catchError((e) {
      Get.defaultDialog(
        title: "Alert!",
        content: const Text("An Error Occoured Try Again"),
        actions: [
          TextButton(
            child: const Text("ok"),
            onPressed: () => Get.back(),
          ),
        ],
      );
      isLoading.value = false;
    });   
  }

  
  void checkStatus() async {
    isLoading.value = true;
    await (Connectivity().checkConnectivity());
    Get.snackbar('problem occured', 'No internet connection...');
    isLoading.value = false;
  }

  void googleSignup(BuildContext context) async {
    isLoading.value = true;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((signedInUser) async {
        data = {
          "email": signedInUser.user!.email,
          "uid": signedInUser.user!.uid,
        };
        await getStorage.write("user", data);
        kUser.value = UserModel.fromJson(data);

        Get.off(() => const Navigation());
        isLoading.value = false;

        // ignore: use_build_context_synchronously
        UserManagement().storeNewUser(signedInUser.user, context);
      }).catchError((e) {
        Get.defaultDialog(
          title: "Alert!",
          content: const Text("Google Email or password error, try again"),
          actions: [
            TextButton(
              child: const Text("ok"),
              onPressed: () => Get.back(),
            ),
          ],
        );
      });
    }
  }
}
