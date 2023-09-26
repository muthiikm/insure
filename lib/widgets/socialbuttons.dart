import 'package:flutter/material.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

Widget socialBtn(ButtonType btn, Function()? onPressed) {
  return SignInButton.mini(
    padding: 14.0,
    buttonType: btn,
    onPressed: onPressed,
    elevation: 4.0,
  );
}
