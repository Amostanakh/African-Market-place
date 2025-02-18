import 'package:afyef/src/models/hex_color.dart';
import 'package:flutter/material.dart';

import '../common.dart';

class CreditCard extends StatelessWidget {
  final String color;
  final String image;
  final int number;
  final String valid;

  CreditCard(
      {required this.color,
      required this.image,
      required this.number,
      required this.valid});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
      child: Container(
        height: 180,
        width: 300,
        decoration: BoxDecoration(
            color: HexColor(color),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: grey,
                  offset: Offset(3, 1),
                  blurRadius: 7,
                  spreadRadius: 2)
            ]),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "images/$image",
                    width: 50,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.more_vert,
                    color: white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "KOIN PAYMENTS\n",
                        style: TextStyle(color: white, fontSize: 18)),
                    TextSpan(text: "**** **** **** ${number.toString()}\n"),
                    TextSpan(
                        text: valid,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300))
                  ], style: const TextStyle(fontSize: 22))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
