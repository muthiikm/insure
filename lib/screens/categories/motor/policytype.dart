import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insure/screens/categories/motor/new.dart';
import 'package:insure/screens/categories/motor/policycard.dart';

class PolicyProvider extends StatefulWidget {
  const PolicyProvider({super.key});

  @override
  State<PolicyProvider> createState() => _PolicyProviderState();
}

class _PolicyProviderState extends State<PolicyProvider> {
  int pageState = 0;
  TextStyle heading =
      const TextStyle(fontSize: 19, fontWeight: FontWeight.bold);
  String type = "Motor Comprehensive";
  String coverclass = "";
  String rate = "3.5";

  void initState() {
    coverclass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.lightBlue),
        backgroundColor: Colors.white60,
        elevation: 0,
      ),
      // body: Center(child: pageState == 0 ? policyClass() : cover()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [pageState == 0 ? policyClass() : cover()],
        ),
      ),
    );
  }

  Widget policyClass() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          Text(
            "What type of class does your vehicle lie in?",
            style: heading,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              coverClass(() {
                setState(() {
                  pageState = 1;
                  coverclass = "Private";
                });
              }, "Private"),
              const Spacer(),
              coverClass(() {}, "Commercial")
            ],
          ),
        ],
      ),
    );
  }

  Widget cover() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          Text(
            "What type of cover do you want?",
            style: heading,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              coverType(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewVehicle(
                              covertype: "Motor $coverclass $type",
                              rate: rate,
                            )));
              }, "Comprehensive"),
              const Spacer(),
              coverType(() {}, "3rd Party "),
            ],
          ),
        ],
      ),
    );
  }
}
