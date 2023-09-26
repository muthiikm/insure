import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insure/screens/account/login.dart';
import 'package:insure/screens/navpages/bottomnav.dart';
import 'package:insure/utils/strings.dart';
import 'package:insure/widgets/slider.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  splashScreenTimer() {
    Timer(const Duration(seconds: 3), () async {
      //user is already logged in
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NavBar(index: 0)));
      } else {
        //not signed in
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    });
  }

  @override
  void initState() {
    splashScreenTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(
            height: 30,
          ),
          Text(
            "Bima App",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30,),
          Text(
            AppText.welcome,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            AppText.intro,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(
            height: 10,
          ),
          WelcomeSlider(),
          SizedBox(
            height: 70,
          ),
          // Agree(),
        ],
      ),
    );
  }
}
