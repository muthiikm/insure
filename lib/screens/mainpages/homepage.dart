import 'package:flutter/material.dart';
import 'package:insure/screens/mainpages/drawer.dart';
import 'package:insure/screens/navpages/bottomnav.dart';
import 'package:insure/widgets/card.dart';
import 'package:insure/widgets/home.dart';

import '../categories/motor/vehicle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle appbarText = const TextStyle(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        actions: [
          const Spacer(
            flex: 14,
          ),
          TextButton.icon(
              onPressed: () {},
              icon: Column(
                children: [
                  const Icon(
                    Icons.shopping_basket,
                    color: Colors.white,
                  ),
                  Text(
                    "quotes",
                    style: appbarText,
                  )
                ],
              ),
              label: const Text("")),
          Stack(children: [
            TextButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavBar(index: 2)));
                },
                icon: Column(
                  children: [
                    const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    Text(
                      "notifications",
                      style: appbarText,
                    )
                  ],
                ),
                label: const Text("")),
            const Positioned(
                top: 1,
                right: 42,
                child: Text(
                  "2",
                  style: TextStyle(color: Colors.black),
                ))
          ]),
          const Spacer()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 0),
              child: Column(
                children: [
                  // const Text(
                  //   "Hello Michael \nChoose an insuance policy below to continue",
                  //   style: TextStyle(fontSize: 22, color: Colors.blue),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  topContainer(context)
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            onOffer(context)
          ],
        ),
      ),
    );
  }
}
