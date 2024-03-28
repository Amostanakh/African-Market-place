import 'package:flutter/material.dart';

class RegButton extends StatelessWidget {
  final Widget? name;
  const RegButton({super.key, required this.name,} );

  @override
  Widget build(BuildContext context) {
    return  Container(
      // width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xfffbb448), Color(0xfff7892b)])),
      child:  name,
    );
  }
}


// Text(name,
//         style:const  TextStyle(fontSize: 20, color: Colors.white),
//       )