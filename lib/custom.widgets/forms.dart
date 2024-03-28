import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';






class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value)? onChanged;
  final String? errorText;
  final String hintText;

  const EmailTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.errorText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          cursorColor: Colors.black,
          controller: controller,
          onChanged: onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (!GetUtils.isEmail(value!)) {
              return "Email is not valid";
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.25),
            hintText: hintText,
          ),
        ),
        errorText != null
            ? Text(
                errorText!,
                style: const TextStyle(
                  color: Colors.red,
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}

// ignore: must_be_immutable
class PasswordInput extends StatefulWidget {
  final String? hintText;
  final TextEditingController controller;

  const PasswordInput({super.key, this.hintText, required this.controller});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextFormField(
        obscureText: obscurePassword,
        cursorColor: Colors.black,
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (!GetUtils.isLengthGreaterThan(value, 5)) {
            return "Minmum of 6 characters";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.withOpacity(0.25),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
            icon: Icon(
              obscurePassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.amber.shade800,
            ),
          ),
          hintText: widget.hintText,
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      )
    ]);
  }
}


 class AddDataTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value)? onChanged;
  final String? errorText;
  final String hintText;

  const AddDataTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.errorText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          cursorColor: Colors.black,
          controller: controller,
          onChanged: onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(70),
            ),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.25),
            hintText: hintText,
          ),
        ),
        errorText != null
            ? Text(
                errorText!,
                style: const TextStyle(
                  color: Colors.red,
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}



class EditTextForm extends StatelessWidget {

  final String? hintText;
  final TextEditingController controller;
  const EditTextForm({super.key, this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (!GetUtils.isLengthGreaterThan(value, 5)) {
            return "Min 5 charectars";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.withOpacity(0.25),
          hintText: hintText,
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      )
    ]);
  }
}


// class TextInput extends StatefulWidget {
  // final String? hintText;
  // final TextEditingController controller;

//   const TextInput({super.key, this.hintText, required this.controller});

//   @override
//   State<PasswordInput> createState() => _TextInputState();
// }

// class _TextInputState extends State<PasswordInput> {
//   bool obscurePassword = true;

//   @override
//   Widget build(BuildContext context) {
    // return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    //   TextFormField(
    //     obscureText: obscurePassword,
    //     cursorColor: Colors.black,
    //     controller: widget.controller,
    //     autovalidateMode: AutovalidateMode.onUserInteraction,
    //     validator: (value) {
    //       if (!GetUtils.isLengthGreaterThan(value, 5)) {
    //         return "Min 5 charectars";
    //       } else {
    //         return null;
    //       }
    //     },
    //     decoration: InputDecoration(
    //       filled: true,
    //       fillColor: Colors.grey.withOpacity(0.25),
    //       hintText: widget.hintText,
    //       border: UnderlineInputBorder(
    //         borderSide: BorderSide.none,
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ),
    //   )
    // ]);
//   }
// }


// Widget entryField(String hintText,final AuthenticationController controller, String title, {bool isPassword = false}  ) {
//   return Container(
//     margin: const EdgeInsets.symmetric(vertical: 10),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           title,
//           style: const TextStyle(
//               fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
//         ),
//         const SizedBox(
//           height: 10,
//         ),

//         TextFormField(
//           cursorColor: Colors.black,
//           decoration: InputDecoration(
//             border: UnderlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             filled: true,
//             fillColor: Colors.grey.withOpacity(0.25),
//             hintText: hintText
//           ),
//         ),
//         // TextFormField(
//         //   cursorColor: Colors.black,
//         //   autovalidateMode: AutovalidateMode.onUserInteraction,
//         //   keyboardType: TextInputType.multiline,
//         //   decoration: InputDecoration(
//         //     border: const OutlineInputBorder(
//         //       borderSide: BorderSide.none,
//         //       // borderRadius: BorderRadius.all(),
//         //     ),
//         //     filled: true,
//         //     fillColor: Colors.grey.withOpacity(0.25),
//         //   ),
//         // ),

//         // TextField(
//         //     obscureText: isPassword,
//         //     decoration:
//         //         const InputDecoration(border: InputBorder.none, filled: true))
//       ],
//     ),
//   );
// }

// Widget emailEntryField(String title, var controller,String hintText, {bool isPassword = false}) {
//   return Container(
//     margin: const EdgeInsets.symmetric(vertical: 10),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           title,
//           style: const TextStyle(
//               fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         TextFormField(
//           cursorColor: Colors.black,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           keyboardType: TextInputType.emailAddress,
          
//           validator: (value) {
//             if (!GetUtils.isEmail(
//               value!,
//             )) {
//               return "Email is not valid";
//             } else {
//               return null;
//             }
//           },
//           decoration: InputDecoration(
//             border: UnderlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             filled: true,
//             fillColor: Colors.grey.withOpacity(0.25),
//             hintText: hintText
//           ),
//         ),

//         // TextField(
//         //     obscureText: isPassword,
//         //     decoration:
//         //         const InputDecoration(border: InputBorder.none, filled: true))
//       ],
//     ),
//   );
// }

// Widget passwordEntryField(String title,String hintText, {bool isPassword = false}) {
//   return Container(
//     margin: const EdgeInsets.symmetric(vertical: 10),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           title,
//           style: const TextStyle(
//               fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         TextFormField(
//           cursorColor: Colors.black,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           keyboardType: TextInputType.emailAddress,
//           validator: (value) {
//             if (!GetUtils.isLengthGreaterThan(value, 5)) {
//               return "Minmum of 6 characters";
//             } else {
//               return null;
//             }
//           },
//           decoration: InputDecoration(
//             border: UnderlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             filled: true,
//             fillColor: Colors.grey.withOpacity(0.25),
//             hintText: hintText,
//             suffixIcon:const  Icon(Icons.remove_red_eye)
//           ),
//         ),

       
//       ],
//     ),
//   );
// }
