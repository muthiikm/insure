import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insure/firebase_options.dart';
import 'package:insure/screens/account/signup.dart';
import 'package:insure/screens/categories/motor/addons.dart';
import 'package:insure/screens/categories/motor/carinfo.dart';
import 'package:insure/screens/mainpages/welcome.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CarDetailsModel()),
      ChangeNotifierProvider(create: (_) => AddOnModel())
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const SignUp(),
        '/second': (context) => const Welcome(),
      },
      home: const Riders(make: "make", model: "model", yom: "yom", value: "value", covertype: "covertype", rate: "rate"),
      // home: const NewVehicle(covertype: "comprehensive", rate: "3"),
      // home: const Companies(make: "toyota", model: "corona", yom: "2021", value: "200000"),
    );
  }
}
