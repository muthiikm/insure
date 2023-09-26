import 'package:flutter/material.dart';

Widget userDetail(IconData icon, String title, void Function()? ontap) {
  return Card(
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(7),
      child: ListTile(
        minLeadingWidth: 0,
        leading: Icon(icon),
        title: Text(title),
        onTap: ontap,
      ),
    ),
  );
}
