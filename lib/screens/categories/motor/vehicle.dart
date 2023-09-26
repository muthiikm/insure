import 'package:flutter/material.dart';
import 'package:insure/screens/categories/motor/new.dart';
import 'package:insure/screens/categories/motor/policytype.dart';
import 'package:insure/widgets/motor.dart';

class Motor extends StatefulWidget {
  const Motor({super.key});

  @override
  State<Motor> createState() => _MotorState();
}

class _MotorState extends State<Motor> {
  int screenState = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Motor Insurance"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Cover new vehicle",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PolicyProvider()));
                    },
                    icon: const Icon(Icons.arrow_forward_ios))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Available Vehicles",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          vehicleCard(() {}, "Toyota", "Toyota Premio", "KDA 376B"),
          vehicleCard(() {}, "Toyota", "Toyota Premio", "KDA 376B"),
          vehicleCard(() {}, "Toyota", "Toyota Premio", "KDA 376B"),
        ],
      ),
    );
  }
}
