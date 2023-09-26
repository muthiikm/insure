import 'package:flutter/material.dart';

Widget item(IconData icon, String text, Function()? ontap) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
    child: GestureDetector(
      onTap: ontap,
      child: Row(
        children: [
          Icon(icon, color: Colors.blue,),
          const SizedBox(
            width: 4,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 18, color: Colors.black38),
          )
        ],
      ),
    ),
  );
}

Widget conditions() {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: (){},
          child: const Text("Terms and Conditions", style: TextStyle(color: Colors.blue),),
        ),
        InkWell(
          onTap: (){},
          child: const Text("Privacy Policy", style: TextStyle(color: Colors.blue),),
        ),
      ],
    ),
  );
}
