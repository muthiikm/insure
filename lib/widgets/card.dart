import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:insure/screens/categories/motor/vehicle.dart';
import 'package:insure/screens/navpages/bottomnav.dart';
import 'package:insure/utils/dialogboxes/comingsoon.dart';

Widget loginCard(Widget child) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 3.0,
      child: child,
    ),
  );
}

Widget insure(
  IconData icon,
  String text,
  Color color,
  Function()? ontap,
) {
  return GestureDetector(
    onTap: ontap,
    child: Column(
      children: [
        Container(
            height: 80,
            width: 90,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                      // color: Color(0xffDDDDDD),
                      color: Colors.grey,
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                      offset: Offset(0.0, 0.0))
                ]),
            child: Icon(
              icon,
              size: 28,
              color: color,
            )),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    ),
  );
}

Widget infoCard(BuildContext context, IconData icon, Color color, String text) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Motor()));
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: Container(
        height: 70,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 6.0,
                  spreadRadius: 2.0,
                  offset: Offset(0, 0)),
            ]),
        child: Row(
          children: [
            const SizedBox(
              width: 3,
            ),
            Icon(
              icon,
              size: 32,
              color: color,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              text,
              textAlign: TextAlign.start,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            )
          ],
        ),
      ),
    ),
  );
}

Widget onOffer(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Services",
                style: TextStyle(fontSize: 18),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavBar(index: 1)));
                  },
                  child: const Text(
                    "view all",
                    style: TextStyle(fontSize: 15),
                  ))
            ],
          ),
          Row(
            children: [
              insure(Icons.commute, "Motor \nInsurance", Colors.tealAccent, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Motor()));
                print("its okay");
              }),
              const Spacer(),
              insure(Icons.monitor_heart_rounded, "Medical \nInsurance",
                  Colors.red, () {
                comingSoon(context);
              }),
              const Spacer(),
              insure(Icons.luggage, "Travel \nInsurance", Colors.greenAccent,
                  () {
                comingSoon(context);
              })
            ],
          ),
          Row(
            children: [
              insure(
                  Icons.house_rounded, "Domestic \nInsurance", Colors.blueGrey,
                  () {
                comingSoon(context);
              }),
              const Spacer(),
              insure(Icons.family_restroom_outlined,
                  "Life Insurance \n& Savings", Colors.orangeAccent, () {
                comingSoon(context);
              }),
              const Spacer(),
              insure(
                  Icons.golf_course, "Golf \nInsurance", Colors.lightBlueAccent,
                  () {
                comingSoon(context);
              })
            ],
          ),
        ],
      ),
    ),
  );
}

Widget policies(BuildContext context) {
  return Column(
    children: [
      infoCard(context, Icons.commute, Colors.tealAccent,
          "Get your motor insurance today "),
      infoCard(context, Icons.health_and_safety, Colors.red,
          "Get your medical insurance cover"),
      infoCard(
          context, Icons.home, Colors.black, "Get your domestic insurance"),
      infoCard(context, Icons.family_restroom, Colors.orange,
          "Get your life insurance"),
      infoCard(context, Icons.commute, Colors.tealAccent,
          "Get your motor insurance"),
      infoCard(context, Icons.commute, Colors.tealAccent,
          "Get your motor insurance"),
      infoCard(context, Icons.commute, Colors.tealAccent,
          "Get your motor insurance"),
      infoCard(context, Icons.commute, Colors.tealAccent,
          "Get your motor insurance"),
    ],
  );
}
