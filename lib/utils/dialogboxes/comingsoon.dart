import 'package:flutter/material.dart';

comingSoon(BuildContext context) {
  AlertDialog alert = AlertDialog(
    elevation: 1,
    contentPadding: const EdgeInsets.only(top: 14, left: 10),
    actionsAlignment: MainAxisAlignment.center,
    backgroundColor: Colors.lightBlueAccent.withOpacity(0.4),
    title: const Text('Exciting News!'),
    titleTextStyle: const TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    content: const Text('This service will be coming to you soon!', style: TextStyle(fontSize: 20),),
    actions: [
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        child: const Text('OK'),
      ),
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
