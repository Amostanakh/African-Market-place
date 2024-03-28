// import 'package:afyef/custom.widgets/Buttons.dart';
// import 'package:afyef/custom.widgets/custom.text.dart';
// import 'package:flutter/material.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key, this.title});
//   final String? title;

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color(0xfff7892b),
//         ),
//         body: Container(
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("images/p2.jpg"), fit: BoxFit.cover)),
//           child: SizedBox(
//             height: height,
//             child: Stack(
//               children: <Widget>[
//                 Positioned(
//                     top: -height * .15,
//                     right: -MediaQuery.of(context).size.width * .4,
//                     child: Container()),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: SingleChildScrollView(
// child: Column(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
//   SizedBox(height: height * .2),
//   title(),
//   const SizedBox(height: 50),
//   registerForm(),
//   const SizedBox(height: 20),
//   regButton(),
//   divider(),
//   alreadyhaveAccountLabel()
// ],
// ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

import 'package:afyef/controllers/authcontoller.dart';
import 'package:afyef/custom.widgets/Buttons.dart';
import 'package:afyef/custom.widgets/buttons.all.dart';
import 'package:afyef/custom.widgets/custom.text.dart';
import 'package:afyef/custom.widgets/forms.dart';
import 'package:afyef/src/widget/custom_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUp extends GetView<AuthenticationController> {
   SignUp({
    Key? key,
  }) : super(key: key);

  bool showPassword = true;

  bool isLoading = false;

  late String email, password;



  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  String? loginError;

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AuthenticationController());
    bool obscureText = false;
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/p2.jpg"),
          fit: BoxFit.cover,
        )),
      ),
      SingleChildScrollView(
        child: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0, left: 25, right: 25),
              child: Form(
                key: globalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 36),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24))),
                      child: Column(
                        children: <Widget>[
                          title(),
                          const SizedBox(height: 50),
EmailTextField(controller: controller.emailController, hintText: 'Email'),
const SizedBox(height: 30),
PasswordInput(controller: controller.passwordController, hintText: "password"),

          const SizedBox(height: 30),
                          const SizedBox(height: 20),
   Obx(
                          () => 
                          
                          GestureDetector(
                            onTap:  () async {
                                var connectivityResult =
                                    await (Connectivity().checkConnectivity());
                                final hasInternet =
                                    connectivityResult != ConnectivityResult.none;
                                if (hasInternet) {
                                 // ignore: use_build_context_synchronously
                                 controller.signup(context);
                                } else if (!hasInternet) {
                                  controller.checkStatus();
                                }
                              },
                            child: RegButton(
                              name: controller.isLoading.value
                                  ? const CircularProgress()
                                  : const Center(
                                      child: Text(
                                        'Sign-Up',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15.0, color: Colors.white),
                                      ),
                                    ),
                              
                            ),
                          ),
                        ),


                        //  GestureDetector(
                        //   onTap: (){
                        //     controller.signup(context);
                        //   },
                        //   child: const RegButton(name: 'SignUp')),
                          divider(),
                          alreadyhaveAccountLabel()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    ]));
  }
}
