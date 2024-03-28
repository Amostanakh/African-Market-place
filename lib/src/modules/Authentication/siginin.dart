// import 'package:afyef/controllers/authcontoller.dart';
// import 'package:afyef/custom.widgets/Buttons.dart';
// import 'package:afyef/custom.widgets/buttons.all.dart';
// import 'package:afyef/custom.widgets/custom.text.dart';
// import 'package:afyef/custom.widgets/forms.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LoginPage extends GetView<AuthenticationController> {
//   const LoginPage({Key? key, this.title}) : super(key: key);

//   final String? title;

//   @override
//   Widget build(BuildContext context) {
//     Get.put(AuthenticationController());
//     final height = MediaQuery.of(context).size.height;
//    return Scaffold(
//         body: Stack(children: [
//       Container(
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//           image: AssetImage("images/p2.jpg"),
//           fit: BoxFit.cover,
//         )),
//       ),

//           SingleChildScrollView(
//         child: Center(
//           child: Column(children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 100.0, left: 25, right: 25),
//               child: Form(
//                 key: globalKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 24, vertical: 36),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all(
//                             color: Colors.grey,
//                           ),
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(24))),
//                       child: Column(
//                         children: <Widget>[
//                           title(),
//                           const SizedBox(height: 50),
// EmailTextField(controller: controller.emailController, hintText: 'Email'),
// const SizedBox(height: 30),
// PasswordInput(controller: controller.passwordController, hintText: "password"),

//           const SizedBox(height: 30),
//                           // registerForm(),
//                           const SizedBox(height: 20),
//                          GestureDetector(
//                           onTap: (){
//                             controller.signup(context);
//                           },
//                           child: const RegButton(name: 'SignUp')),
//                           divider(),
//                           googleButton(),
//                           alreadyhaveAccountLabel()
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ]),
//         ),
//       ),
// //       SingleChildScrollView(
// //         child: Center(
// //           child: Column(children: [
// //             Padding(
// //               padding: const EdgeInsets.only(top: 100.0, left: 25, right: 25),
// //               child: Form(

// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.start,
// //                   children: <Widget>[
// //                     Container(
// //                       padding: const EdgeInsets.symmetric(
// //                           horizontal: 24, vertical: 36),
// //                       decoration: BoxDecoration(
// //                           color: Colors.white,
// //                           border: Border.all(
// //                             color: Colors.grey,
// //                           ),
// //                           borderRadius:
// //                               const BorderRadius.all(Radius.circular(24))),
// //                       child: Column(
// //                         children: <Widget>[
// //                           title(),
// //                           const SizedBox(height: 50),
// //                           // loginForm(),
// //                           EmailTextField(controller: controller.emailController, hintText: 'Email'),
// // const SizedBox(height: 30),
// // PasswordInput(controller: controller.passwordController, hintText: "password"),
// //                                                 const SizedBox(height: 20),
// //                      GestureDetector(
// //                       onTap: (){
// //                         controller.login();
// //                       },
// //                       child: const  RegButton(name: 'SignIn')),
// //                       Container(
// //                         padding: const EdgeInsets.symmetric(vertical: 10),
// //                         alignment: Alignment.centerRight,
// //                         child: const Text('Forgot Password ?',
// //                             style: TextStyle(
// //                                 fontSize: 14, fontWeight: FontWeight.w500)),
// //                       ),
// //                       divider(),
// //                       googleButton(),
// //                           const SizedBox(height: 10),
// //                           divider(),
// //                           createAccountLabel()
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             )
// //           ]),
// //         ),
// //       ),
//     ]));
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


class LoginPage extends GetView<AuthenticationController> {
   LoginPage({
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

                          Text('Welcome',
                           style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.black),),
             Text('To',
                           style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.black),),
                          title(),
                          const SizedBox(height: 50),
EmailTextField(controller: controller.emailController, hintText: 'Email'),
const SizedBox(height: 30),
PasswordInput(controller: controller.passwordController, hintText: "password"),
          const SizedBox(height: 30),
                          const SizedBox(height: 20),
                         GestureDetector(
                          onTap: (){
                            controller.login();
                          },
                          child: 
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
                                        'Sign-In',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15.0, color: Colors.white),
                                      ),
                                    ),
                              
                            ),
                          ),
                        ),
                          ),
                          divider(),
                          GestureDetector(
                             onTap:  () async {
                                var connectivityResult =
                                    await (Connectivity().checkConnectivity());
                                final hasInternet =
                                    connectivityResult != ConnectivityResult.none;
                                if (hasInternet) {
                                 // ignore: use_build_context_synchronously
                                 controller.googleSignup(context);
                                } else if (!hasInternet) {
                                  controller.checkStatus();
                                }
                              },
                            child: googleButton()),
                          createAccountLabel()
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
