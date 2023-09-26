import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget resend(Function()? ontap) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      children: [
        const TextSpan(text: "Didn't receive the code?", style: TextStyle(color: Colors.black)),
        TextSpan(
          text: " Resend",
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
          recognizer: TapGestureRecognizer()
          ..onTap = ontap
        )
      ]
    ));
}
