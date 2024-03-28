import 'package:afyef/src/modules/Authentication/siginin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../src/modules/Authentication/signup.dart';

Widget createAccountLabel() {
  return InkWell(
    onTap: () {
      Get.to( SignUp());
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(15),
      alignment: Alignment.bottomCenter,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(
                fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'SignUp',
            style: TextStyle(
                color: Color(0xfff79c4f),
                fontSize: 13,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}

Widget alreadyhaveAccountLabel() {
  return InkWell(
    onTap: () {
      Get.to( LoginPage());
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(15),
      alignment: Alignment.bottomCenter,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account ?',
            style: TextStyle(
                fontSize: 13, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'login',
            style: TextStyle(
                color: Color(0xfff79c4f),
                fontSize: 13,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}

Widget title() {
  return RichText(
    textAlign: TextAlign.center,
    text: const TextSpan(
        text: 'A',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10)),
        children: [
          TextSpan(
            text: 'fY',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          TextSpan(
            text: 'EF',
            style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
          ),
        ]),
  );
}

// Widget loginForm() {
//   return Column(
//     children: <Widget>[
//       // emailEntryField("Email", 'Password'),

//     ],
//   );
// }

// Widget registerForm() {
//   return Column(
//     children: <Widget>[
//       // entryField("Name"),
//       // emailEntryField("Email", "Email"),
//       // MyWidget()
//       // entryField("Phone" , 'Phone'),
//       // passwordEntryField("Password","Password", isPassword: true)
//     ],
//   );
// }
