// ignore_for_file: unnecessary_cast

import 'package:afyef/src/models/newuser.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

Rx<UserModel?> kUser = (null as UserModel?).obs;
User? currentFirebaseUser = FirebaseAuth.instance.currentUser;
final firestor = FirebaseFirestore.instance
        .collection('users') .doc(currentFirebaseUser?.uid);






        // import 'dart:io'; 
// import 'package:afyef/controllers/authcontoller.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart'; 
// import 'package:image_picker/image_picker.dart'; 
// import 'package:cloud_firestore/cloud_firestore.dart'; 
// import 'package:flutter/material.dart'; 

// class  EditDetailsPage extends GetView<AuthenticationController> { 
// EditDetailsPage({Key? key}) : super(key: key); 

// var nameController =  TextEditingController(); 
// var ageController =  TextEditingController(); 
// var dlController =  TextEditingController(); 
// var adController =  TextEditingController(); 
// var phnController =  TextEditingController(); 

// final firestore = FirebaseFirestore.instance; 
// File? _image; 
// get data => null; 

// @override 
// Widget build(BuildContext context) { 
// return Center( 
// 	child: Scaffold( 
// 	body: SafeArea( 
// 	child: SingleChildScrollView( 
// 		child: Padding( 
// 		padding: const EdgeInsets.all(20.0), 
// 		child: Column( 
// 			children: [ 
// 			Text( 
// 				'Insert Driver Details', 
// 				style: TextStyle(fontSize: 28), 
// 			), 
// 			Text("Add Data"), 
// 			Container( 
// 				height: 150, 
// 				width: 300, 
// 				decoration: BoxDecoration( 
// 				border: Border.all(color: Colors.black), 
// 				borderRadius: BorderRadius.circular(20), 
// 				), 
// 				child: Center( 
// 				child: Column( 
// 					mainAxisAlignment: MainAxisAlignment.spaceBetween, 
// 					children: [ 

// Obx(() => controller.selectedImage.value == ''? Image.file(File(controller.selectedImage.value)) : Text('No Data') ),

// 					// Expanded( 
// 					// 	child: Center( 
// 					// 	child: _image == null 
// 					// 		? const Text('No image selected.') 
// 					// 		: Image.file(Image.file(File(controller.selectedImage.value)) as File), 
// 					// 	), 
// 					// ), 
// 					ElevatedButton( 
// 						onPressed: () async { 
//               controller.getImage();
// 						// final image = await ImagePicker().pickImage(source: ImageSource.gallery); 
// 						// if (image != null) { 
// 						// 	_image = File(image.path); 
// 						// } 
// 						}, 
// 						child: Text('Select image'), 
// 					), 
// 					], 
// 				), 
// 				), 
// 			), 
// 			SizedBox( 
// 				height: 30, 
// 			), 
// 			SizedBox( 
// 				height: 50, 
// 			), 
// 			TextFormField( 
// 				controller: nameController, 
// 				maxLength: 15, 
// 				decoration: InputDecoration( 
// 					labelText: 'Name', 
// 					border: OutlineInputBorder( 
// 						borderSide: BorderSide(color: Colors.amber))), 
// 			), 
// 			SizedBox( 
// 				height: 15, 
// 			), 
// 			TextFormField( 
// 				controller: ageController, 
// 				keyboardType: TextInputType.number, 
// 				decoration: InputDecoration( 
// 					labelText: 'Age', 
// 					border: OutlineInputBorder( 
// 						borderSide: BorderSide(color: Colors.amber))), 
// 			), 
// 			SizedBox( 
// 				height: 15, 
// 			), 
// 			TextFormField( 
// 				controller: dlController, 
// 				maxLength: 20, 
// 				decoration: InputDecoration( 
// 					labelText: 'Driving Licencse Number', 
// 					border: OutlineInputBorder( 
// 						borderSide: BorderSide(color: Colors.amber))), 
// 			), 
// 			SizedBox( 
// 				height: 15, 
// 			), 
// 			TextFormField( 
// 				controller: adController, 
// 				decoration: InputDecoration( 
// 					labelText: 'Address', 
// 					border: OutlineInputBorder( 
// 						borderSide: BorderSide(color: Colors.amber))), 
// 			), 
// 			SizedBox( 
// 				height: 15, 
// 			), 
// 			TextFormField( 
// 				controller: phnController, 
// 				maxLength: 10, 
// 				keyboardType: TextInputType.number, 
// 				decoration: InputDecoration( 
// 					labelText: 'Phone No.', 
// 					border: OutlineInputBorder( 
// 						borderSide: BorderSide(color: Colors.amber))), 
// 			), 
// 			SizedBox( 
// 				height: 20, 
// 			), 
// 			ElevatedButton( 
// 				onPressed: () async { 
// 				if (nameController.text.isNotEmpty && 
// 					ageController.text.isNotEmpty && 
// 					dlController.text.isNotEmpty && 
// 					adController.text.isNotEmpty && 
// 					phnController.text.isNotEmpty 
// 				&& _image.toString().isNotEmpty) { 
// 					showDialog( 
// 					context: context, 
// 					builder: (BuildContext context) { 
// 						return AlertDialog( 
// 						title: Text("Confirmation"), 
// 						content: Text( 
// 							"Are you sure you want to submit these details?"), 
// 						actions: [ 
// 							TextButton( 
// 							child: Text( 
// 								"Cancel", 
// 								style: TextStyle(color: Colors.amber), 
// 							), 
// 							onPressed: () { 
// 								nameController.clear(); 
// 								ageController.clear(); 
// 								dlController.clear(); 
// 								adController.clear(); 
// 								phnController.clear(); 
// 								Navigator.of(context).pop(); 
// 							}, 
// 							), 
// 							TextButton( 
// 							child: Text( 
// 								"Submit", 
// 								style: TextStyle(color: Colors.amber), 
// 							), 
// 							onPressed: () async { 
// 								// Upload image file to Firebase Storage 
// 								var imageName = DateTime.now().millisecondsSinceEpoch.toString(); 
// 								var storageRef = FirebaseStorage.instance.ref().child('driver_images/$imageName.jpg'); 
// 								var uploadTask = storageRef.putFile(_image!); 
// 								var downloadUrl = await (await uploadTask).ref.getDownloadURL(); 

// 								firestore.collection("Driver Details").add({ 
// 								"Name": nameController.text, 
// 								"Age": ageController.text, 
// 								"Driving Licence": dlController.text, 
// 								"Address.": adController.text, 
// 								"Phone No.": phnController.text, 
// 								// Add image reference to document 
// 								"Image": downloadUrl.toString() 
// 								}); 
// 								Navigator.of(context).pop(); 
// 								nameController.clear(); 
// 								ageController.clear(); 
// 								dlController.clear(); 
// 								adController.clear(); 
// 								phnController.clear(); 
// 							}, 
// 							), 
// 						], 
// 						); 
// 					}, 
// 					); 
// 				} 
// 				}, 
// 				child: Text( 
// 				"Submit Details", 
// 				), 
// 				style: ElevatedButton.styleFrom( 
// 					backgroundColor: Colors.amber, 
// 					shape: RoundedRectangleBorder( 
// 						borderRadius: BorderRadius.circular(10))), 
// 			) 
// 			], 
// 		), 
// 		), 
// 	), 
// 	), 
// )); 
// } 
// }



 


//  import 'dart:io';
// import 'package:afyef/custom.widgets/buttons.all.dart';
// import 'package:afyef/custom.widgets/forms.dart';
// import 'package:afyef/src/common.dart';
// import 'package:afyef/src/config/config.dart';
// import 'package:afyef/src/widget/custom_text.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../controllers/authcontoller.dart';

// class EditDetailsPage extends GetView<AuthenticationController> {
//   @override
//   Widget build(BuildContext context) {
//     print(firestor.id);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Details'),
//       ),
//       body: SingleChildScrollView(
//               child: Center(
//                 child: Column(
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.all(10.0),
//                       child: Text(
//                         "Update Profile Picture",
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.center,
                        
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return Dialog(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12.0),
//                                 ),
//                                 // ignore: sized_box_for_whitespace
//                                 child: Container(
//                                   height: 200.0,
//                                   width: MediaQuery.of(context).size.width - 80,
//                                   child: Center(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         GestureDetector(
//                                           onTap: () async {
//                                             controller.getImage();
//                                             Future.delayed(const Duration(milliseconds: 100), () {
//                                               Navigator.pop(context);
//                                             });
//                                           },
//                                           child: const Column(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               Icon(
//                                                 Icons.photo_library_rounded,
//                                                 size: 60.0,
//                                                 color: Colors.red,
//                                               ),
//                                               Text(
//                                                 'Gallery'
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           width: 40.0,
//                                         ),
                                      
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             });
//                       },
//                       child: Stack(
//                         children: [
//                           Container(
//                             height: 120,
//                             width: 120,
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.black54, width: 1),
//                               borderRadius: const BorderRadius.all(Radius.circular(120)),
//                               // image: imagePath == 'No Data'
//                               //     ? DecorationImage(
//                               //         image: NetworkImage(profilePicture),
//                               //         fit: BoxFit.cover,
//                               //       )
//                               //     : DecorationImage(
//                               //         image: FileImage(imageFile),
//                               //         fit: BoxFit.cover,
//                               //       ),
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 0,
//                             right: 0,
//                             child: Container(
//                               height: 35,
//                               width: 35,
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.white, width: 2),
//                                 borderRadius: const BorderRadius.all(Radius.circular(120)),
//                                 color: Colors.amber,
//                               ),
//                               child: const Icon(
//                                 Icons.camera_alt_outlined,
//                                 size: 20,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20.0),


//             EditTextForm(
//               controller: controller.profesionController,
//               hintText: "Profession",
//             ),
//              const SizedBox(
//                       height: 40.0,
//                     ),
//             EditTextForm(
//               controller: controller.businessController,
//               hintText: 'Business Line',
//             ),
//            const SizedBox(
//                       height: 40.0,
//                     ),
//             EditTextForm(
//                 controller: controller.phoneController, hintText: 'Phone '),
//            const SizedBox(
//                       height: 40.0,
//                     ),
//             EditTextForm(
//                 controller: controller.countryController, hintText: 'Country '),
//                     const SizedBox(
//                       height: 40.0,
//                     ),
//                       Obx(
//                           () =>       
//                           GestureDetector(
//                             onTap:  () async {
//                                 var connectivityResult =
//                                     await (Connectivity().checkConnectivity());
//                                 final hasInternet =
//                                     connectivityResult != ConnectivityResult.none;
//                                 if (hasInternet) {
                                 
//                                  controller.editUserDeatils();
//                                 } else if (!hasInternet) {
//                                   controller.checkStatus();
//                                 }
//                               },
//                             child: RegButton(
//                               name: controller.isLoading.value
//                                   ? const CircularProgress()
//                                   : const Center(
//                                       child: Text(
//                                         'Save',
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                             fontSize: 15.0, color: Colors.white),
//                                       ),
//                                     ),
                              
//                             ),
//                           ),
//                         ),  
                    
//                   ],
//                 ),
//               ),
//             ),
      
      
// //        Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             Obx(
// //               () => controller.selectedImage.value == ''
// //                   ? Column(
// //                     children: [
  


//                       // Container(
//                       //     height: 120,
//                       //     width: 120,
//                       //     decoration: BoxDecoration(
//                       //       border: Border.all(color: Colors.black54, width: 1),
//                       //       borderRadius:
//                       //           const BorderRadius.all(Radius.circular(120)),
//                       //     ),
//                       //     child: 
//                       //        Positioned(
//                       //           bottom: 0,
//                       //           right: 0,
//                       //           child: CircleAvatar(
//                       //               backgroundColor: Colors.transparent,
//                       //               child: SizedBox(
//                       //                   width: 190,
//                       //                   height: 190,
//                       //                   child: ClipOval(
//                       //                     child: Image.asset(
//                       //                       "images/ava.jpeg",
//                       //                     ),
//                       //                   )))),
//                       //     ),
                      
//             //            const SizedBox(height: 20,),
//             //             GestureDetector(
//             //                 onTap: () {
//             //                   controller.getImage();
//             //                 },
//             //            child: Text('Upload Profile Picture',style: TextStyle( color: orange),))
//             //         ],
//             //       )
//             //       : SizedBox(
//             //           height: 200,
//             //           width: 300,
//             //           child: GestureDetector(
//             //             onTap: () {
//             //               controller.getImage();
//             //             },
//             //             child: Positioned(
//             //                 bottom: 0,
//             //                 right: 0,
//             //                 height: 35,
//             //                 width: 35,
//             //                 child: Image.file(
//             //                     File(controller.selectedImage.value))),
//             //           ),
//             //         ),
//             // ),


//             // EditTextForm(
//             //   controller: controller.profesionController,
//             //   hintText: "Profession",
//             // ),
//             // EditTextForm(
//             //   controller: controller.businessController,
//             //   hintText: 'Business Line',
//             // ),
//             // EditTextForm(
//             //     controller: controller.phoneController, hintText: 'Phone '),
//             // EditTextForm(
//             //     controller: controller.countryController, hintText: 'Country '),

// // Obx(
// //                           () => 
                          
// //                           GestureDetector(
// //                             onTap:  () async {
// //                                 var connectivityResult =
// //                                     await (Connectivity().checkConnectivity());
// //                                 final hasInternet =
// //                                     connectivityResult != ConnectivityResult.none;
// //                                 if (hasInternet) {
                                 
// //                                  controller.editUserDeatils();
// //                                 } else if (!hasInternet) {
// //                                   controller.checkStatus();
// //                                 }
// //                               },
// //                             child: RegButton(
// //                               name: controller.isLoading.value
// //                                   ? const CircularProgress()
// //                                   : const Center(
// //                                       child: Text(
// //                                         'Save',
// //                                         textAlign: TextAlign.center,
// //                                         style: TextStyle(
// //                                             fontSize: 15.0, color: Colors.white),
// //                                       ),
// //                                     ),
                              
// //                             ),
// //                           ),
// //                         ),


// //             // ElevatedButton(
// //             //   onPressed: () {
// //             //     controller.editUserDeatils();
// //             //   },
// //             //   child: const Text('Save'),
// //             // ),
// //           ],
// //         ),
// //       ),
//     );
//   }
// }




// // import 'dart:io'; 
// // import 'package:afyef/controllers/authcontoller.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:get/get.dart';
// // import 'package:get/get_state_manager/src/simple/get_view.dart'; 
// // import 'package:image_picker/image_picker.dart'; 
// // import 'package:cloud_firestore/cloud_firestore.dart'; 
// // import 'package:flutter/material.dart'; 

// // class  EditDetailsPage extends GetView<AuthenticationController> { 
// // EditDetailsPage({Key? key}) : super(key: key); 

// // var nameController =  TextEditingController(); 
// // var ageController =  TextEditingController(); 
// // var dlController =  TextEditingController(); 
// // var adController =  TextEditingController(); 
// // var phnController =  TextEditingController(); 

// // final firestore = FirebaseFirestore.instance; 
// // File? _image; 
// // get data => null; 

// // @override 
// // Widget build(BuildContext context) { 
// // return Center( 
// // 	child: Scaffold( 
// // 	body: SafeArea( 
// // 	child: SingleChildScrollView( 
// // 		child: Padding( 
// // 		padding: const EdgeInsets.all(20.0), 
// // 		child: Column( 
// // 			children: [ 
// // 			Text( 
// // 				'Insert Driver Details', 
// // 				style: TextStyle(fontSize: 28), 
// // 			), 
// // 			Text("Add Data"), 
// // 			Container( 
// // 				height: 150, 
// // 				width: 300, 
// // 				decoration: BoxDecoration( 
// // 				border: Border.all(color: Colors.black), 
// // 				borderRadius: BorderRadius.circular(20), 
// // 				), 
// // 				child: Center( 
// // 				child: Column( 
// // 					mainAxisAlignment: MainAxisAlignment.spaceBetween, 
// // 					children: [ 

// // Obx(() => controller.selectedImage.value == ''? Image.file(File(controller.selectedImage.value)) : Text('No Data') ),

// // 					// Expanded( 
// // 					// 	child: Center( 
// // 					// 	child: _image == null 
// // 					// 		? const Text('No image selected.') 
// // 					// 		: Image.file(Image.file(File(controller.selectedImage.value)) as File), 
// // 					// 	), 
// // 					// ), 
// // 					ElevatedButton( 
// // 						onPressed: () async { 
// //               controller.getImage();
// // 						// final image = await ImagePicker().pickImage(source: ImageSource.gallery); 
// // 						// if (image != null) { 
// // 						// 	_image = File(image.path); 
// // 						// } 
// // 						}, 
// // 						child: Text('Select image'), 
// // 					), 
// // 					], 
// // 				), 
// // 				), 
// // 			), 
// // 			SizedBox( 
// // 				height: 30, 
// // 			), 
// // 			SizedBox( 
// // 				height: 50, 
// // 			), 
// // 			TextFormField( 
// // 				controller: nameController, 
// // 				maxLength: 15, 
// // 				decoration: InputDecoration( 
// // 					labelText: 'Name', 
// // 					border: OutlineInputBorder( 
// // 						borderSide: BorderSide(color: Colors.amber))), 
// // 			), 
// // 			SizedBox( 
// // 				height: 15, 
// // 			), 
// // 			TextFormField( 
// // 				controller: ageController, 
// // 				keyboardType: TextInputType.number, 
// // 				decoration: InputDecoration( 
// // 					labelText: 'Age', 
// // 					border: OutlineInputBorder( 
// // 						borderSide: BorderSide(color: Colors.amber))), 
// // 			), 
// // 			SizedBox( 
// // 				height: 15, 
// // 			), 
// // 			TextFormField( 
// // 				controller: dlController, 
// // 				maxLength: 20, 
// // 				decoration: InputDecoration( 
// // 					labelText: 'Driving Licencse Number', 
// // 					border: OutlineInputBorder( 
// // 						borderSide: BorderSide(color: Colors.amber))), 
// // 			), 
// // 			SizedBox( 
// // 				height: 15, 
// // 			), 
// // 			TextFormField( 
// // 				controller: adController, 
// // 				decoration: InputDecoration( 
// // 					labelText: 'Address', 
// // 					border: OutlineInputBorder( 
// // 						borderSide: BorderSide(color: Colors.amber))), 
// // 			), 
// // 			SizedBox( 
// // 				height: 15, 
// // 			), 
// // 			TextFormField( 
// // 				controller: phnController, 
// // 				maxLength: 10, 
// // 				keyboardType: TextInputType.number, 
// // 				decoration: InputDecoration( 
// // 					labelText: 'Phone No.', 
// // 					border: OutlineInputBorder( 
// // 						borderSide: BorderSide(color: Colors.amber))), 
// // 			), 
// // 			SizedBox( 
// // 				height: 20, 
// // 			), 
// // 			ElevatedButton( 
// // 				onPressed: () async { 
// // 				if (nameController.text.isNotEmpty && 
// // 					ageController.text.isNotEmpty && 
// // 					dlController.text.isNotEmpty && 
// // 					adController.text.isNotEmpty && 
// // 					phnController.text.isNotEmpty 
// // 				&& _image.toString().isNotEmpty) { 
// // 					showDialog( 
// // 					context: context, 
// // 					builder: (BuildContext context) { 
// // 						return AlertDialog( 
// // 						title: Text("Confirmation"), 
// // 						content: Text( 
// // 							"Are you sure you want to submit these details?"), 
// // 						actions: [ 
// // 							TextButton( 
// // 							child: Text( 
// // 								"Cancel", 
// // 								style: TextStyle(color: Colors.amber), 
// // 							), 
// // 							onPressed: () { 
// // 								nameController.clear(); 
// // 								ageController.clear(); 
// // 								dlController.clear(); 
// // 								adController.clear(); 
// // 								phnController.clear(); 
// // 								Navigator.of(context).pop(); 
// // 							}, 
// // 							), 
// // 							TextButton( 
// // 							child: Text( 
// // 								"Submit", 
// // 								style: TextStyle(color: Colors.amber), 
// // 							), 
// // 							onPressed: () async { 
// // 								// Upload image file to Firebase Storage 
// // 								var imageName = DateTime.now().millisecondsSinceEpoch.toString(); 
// // 								var storageRef = FirebaseStorage.instance.ref().child('driver_images/$imageName.jpg'); 
// // 								var uploadTask = storageRef.putFile(_image!); 
// // 								var downloadUrl = await (await uploadTask).ref.getDownloadURL(); 

// // 								firestore.collection("Driver Details").add({ 
// // 								"Name": nameController.text, 
// // 								"Age": ageController.text, 
// // 								"Driving Licence": dlController.text, 
// // 								"Address.": adController.text, 
// // 								"Phone No.": phnController.text, 
// // 								// Add image reference to document 
// // 								"Image": downloadUrl.toString() 
// // 								}); 
// // 								Navigator.of(context).pop(); 
// // 								nameController.clear(); 
// // 								ageController.clear(); 
// // 								dlController.clear(); 
// // 								adController.clear(); 
// // 								phnController.clear(); 
// // 							}, 
// // 							), 
// // 						], 
// // 						); 
// // 					}, 
// // 					); 
// // 				} 
// // 				}, 
// // 				child: Text( 
// // 				"Submit Details", 
// // 				), 
// // 				style: ElevatedButton.styleFrom( 
// // 					backgroundColor: Colors.amber, 
// // 					shape: RoundedRectangleBorder( 
// // 						borderRadius: BorderRadius.circular(10))), 
// // 			) 
// // 			], 
// // 		), 
// // 		), 
// // 	), 
// // 	), 
// // )); 
// // } 
// // }