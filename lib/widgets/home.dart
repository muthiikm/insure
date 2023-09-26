import 'package:flutter/material.dart';
import 'package:insure/widgets/slider.dart';

Widget topContainer(BuildContext context) {
  return SafeArea(
    child: Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 130,
            decoration: const BoxDecoration(
              color: Colors.lightBlueAccent,
              // borderRadius: BorderRadius.all(Radius.circular(30)),
              borderRadius: BorderRadius.vertical(
                // bottom: Radius.elliptical(
                //   MediaQuery.of(context).size.width, 100
                // )
                // bottom: Radius.circular(12),
              )
            ),
          )),
        const Positioned(
          top: 5,
          right: 5,
          left: 8,
          child: Text(
                "Hello Michael",
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),),
        const Positioned(
          top: 32,
          right: 5,
          left: 8,
          child: Text(
                "Bima Care insures you within moments of application.",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),),
        const SizedBox(height: 70,),
        const WelcomeSlider(),
      ],
    ),
  );
}
