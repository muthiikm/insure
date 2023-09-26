import 'package:flutter/material.dart';
import 'package:insure/utils/colors.dart';

Widget coverClass(Function()? pressed, String text) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          const Text(
            "What type of class does your vehicle lie in?",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 50,
            child: ElevatedButton(onPressed: pressed, child: Text(text)),
          )
        ],
      ),
    ),
  );
}

Widget vehicleCard(Function()? ontap, String make, String model, String regno) {
  return GestureDetector(
    onTap: ontap,
    child: Card(
      color: AppColors.colors[2],
      shadowColor: Colors.grey,
      child: Column(
        children: [
          Text(make),
          Text(model),
          Text(regno)
        ],
      ),
    ),
  );
}
