import 'package:flutter/material.dart';

Widget coverClass(Function()? ontap, String text) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 60,
      width: 140,
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade100,
        borderRadius: const BorderRadius.all(Radius.circular(12))
      ),
      child: Center(
        child: Text(text),
      ),
    ),
  );
}

Widget coverType(Function()? ontap, String text) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 60,
      width: 140,
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade100,
        borderRadius: const BorderRadius.all(Radius.circular(12))
      ),
      child: Center(
        child: Text(text),
      ),
    ),
  );
}
