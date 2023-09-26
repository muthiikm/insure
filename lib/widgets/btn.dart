import 'package:flutter/material.dart';

Widget button(BuildContext context, void Function()? pressed, String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width / 1,
      child: ElevatedButton(
          onPressed: pressed,
          child: Text(text, style: const TextStyle(fontSize: 17))),
    ),
  );
}

Widget textbtn(void Function()? pressed, String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextButton(
        onPressed: pressed,
        child: Text(text))
    ],
  );
}
