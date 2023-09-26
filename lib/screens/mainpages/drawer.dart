import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:insure/models/userdata/usermodel.dart';
import 'package:insure/utils/snackbar.dart';

import '../../utils/dialogboxes/logoutdialog.dart';
import '../../widgets/menu.dart';
import '../account/login.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  User? user;
  static final _auth = FirebaseAuth.instance;
  UserModel? userModel;
  late DatabaseReference userRef =
      FirebaseDatabase.instance.ref().child("users");

  getUserDetails() async {
    DataSnapshot snapshot = await userRef.get();
    userModel =
        UserModel.fromMap(Map<String, dynamic>.from(snapshot.value as Map));
    setState(() {});
  }

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userRef = FirebaseDatabase.instance.ref().child("users").child(user!.uid);
    }
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    // final carDetailsModel = Provider.of<CarDetailsModel>(context);
    return Drawer(
      backgroundColor: Colors.lightBlue.shade100,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('img/avater.jpg'),
                ),
                const SizedBox(width: 10),
                Text(
                  userModel?.fullname ?? user!.displayName ?? "",
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          item(Icons.email, userModel?.email ?? user!.email ?? "", () {}),
          item(Icons.person, "profile", () {}),
          item(Icons.local_offer, "Offers", () {}),
          item(Icons.policy, "My Policies", () {}),
          item(Icons.email, user!.displayName ?? "Email Us", () {}),
          item(Icons.phone_in_talk, "Talk to Us", () {}),
          item(Icons.settings, "Settings", () {}),
          item(Icons.logout, "Sign Out", logout),
          const SizedBox(
            height: 100,
          ),
          conditions()
        ],
      ),
    );
  }

  //Sign Out.
  void logout() async {
    // logoutMsg(context, () async {
    //   try {
    //     await _auth.signOut();
    //     if (!mounted) return;
    //     Navigator.of(context).pushReplacement(
    //         MaterialPageRoute(builder: (context) => const LoginPage()));
    //   } on FirebaseAuthException catch (e) {
    //     showSnackBar(context, e.message!);
    //   }
    // });
    showLogoutDialog(context, () async {
      try {
        await _auth.signOut();
        if (!mounted) return;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      } on FirebaseAuthException catch (e) {
        showSnackBarText(context, e.message!);
      }
    }, () {
      Navigator.pop(context);
    });
  }
}
