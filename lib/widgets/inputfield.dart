import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget loginField(String label, TextEditingController cont, bool obscure, String? Function(String?)? validate, TextInputType inputType, [int? max, void Function()? pressed, IconData? icon,]) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: cont,
      obscureText: obscure,
      validator: validate,
      maxLength: max,
      keyboardType: inputType,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 216, 211, 211),
        filled: false,
        label: Text(label), 
        border: const UnderlineInputBorder(),
        focusColor: Colors.black,
        suffixIcon: IconButton(onPressed: pressed, icon: Icon(icon,),)
        ),
    ),
  );
}

Widget signupField(String label, TextEditingController cont, bool obscure, String? Function(String?)? validate, TextInputType inputType) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: cont,
      obscureText: obscure,
      validator: validate,
      keyboardType: inputType,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 216, 211, 211),
        filled: false,
        label: Text(label), 
        border: const UnderlineInputBorder(),
        ),
    ),
  );
}

Widget motorInfo(String heading,String label, TextEditingController cont, bool obscure, String? Function(String?)? validate, TextInputType inputType,) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading),
        TextFormField(
          controller: cont,
          obscureText: obscure,
          validator: validate,
          keyboardType: inputType,
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 216, 211, 211),
            filled: false,
            label: Text(label), 
            border: const UnderlineInputBorder(),
            ),
        ),
      ],
    ),
  );
}
