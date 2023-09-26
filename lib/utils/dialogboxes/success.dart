import 'package:blurry/blurry.dart';
import 'package:flutter/material.dart';
import 'package:insure/screens/navpages/bottomnav.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:quickalert/quickalert.dart';

showSuccessMsg(BuildContext context, String text, String title) {
  return QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: text,
      title: title,
      customAsset: "img/insure1.png");
}

successAlert(BuildContext context, String message) {
  return Blurry.success(
      title: 'Success',
      popupHeight: 150,
      description: message,
      confirmButtonText: 'Okay',
      displayCancelButton: false,
      barrierColor: Colors.white.withOpacity(0.7),
      onConfirmButtonPressed: () {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const NavBar(index: 0,)), (route) => false);
      }).show(context);
}


