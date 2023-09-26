import 'package:flutter/material.dart';
import 'package:insure/screens/categories/motor/companyrates.dart';
import 'package:insure/screens/categories/motor/quote.dart';
import 'package:insure/screens/categories/motor/thanks.dart';
import 'package:insure/services/calc.dart';
import 'package:insure/utils/colors.dart';
import 'package:intl/intl.dart';

class Companies extends StatefulWidget {
  final String make;
  final String model;
  final String yom;
  final String value;
  final String covertype;
  final String rate;
  final String start;
  final String end;
  const Companies(
      {required this.make,
      required this.model,
      required this.yom,
      required this.value,
      required this.covertype,
      required this.rate,
      required this.start,
      required this.end,
      super.key});

  @override
  State<Companies> createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  late int age;
  late double value;
  late double premium;
  late double premium1 = 0;
  late double premium2 = 0;
  late double premium3 = 0;
  late double premium4 = 0;
  late double premium5 = 0;
  var formatter = NumberFormat('#,###.##');

  @override
  void initState() {
    premium1;
    premium2;
    premium3;
    premium4;
    premium5;
    age = DateTime.now().year - int.parse(widget.yom);
    double baseRate = double.parse(widget.value) * 0.0325;
    double ageRate = age >= 3 ? (age - 2) * 0.02 : 0.0;
    premium = baseRate + ageRate;
    double baseRate1 = double.parse(widget.value) * 0.03;
    premium1 = baseRate1 + ageRate;
    double baseRate2 = double.parse(widget.value) * 0.0315;
    premium2 = baseRate2 + ageRate;
    double baseRate3 = double.parse(widget.value) * 0.0295;
    premium3 = baseRate3 + ageRate;
    double baseRate4 = double.parse(widget.value) * 0.0345;
    double baserate4 = double.parse(baseRate4.toStringAsFixed(2));
    premium4 = baserate4 + ageRate;
    double baseRate5 = double.parse(widget.value) * 0.0425;
    double baserate5 = double.parse(baseRate5.toStringAsFixed(2));
    premium5 = baserate5 + ageRate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Suggested Covers", style: TextStyle(color: Colors.cyan),),
      //   backgroundColor: Colors.lightBlue,
      // ),
      backgroundColor: Colors.lightBlue.shade100,
      body: SingleChildScrollView(child: choices()),
    );
  }

  Widget choices() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8, top: 8),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Available Quotes.",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          company(widget.make, widget.model, "img/jubilee.png",
              "KSH ${premium.toString()}", widget.covertype, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Quote(
                          insurer: "Jubilee Insurance",
                          covertype: widget.covertype,
                          premium: "$premium",
                          rate: widget.rate,
                          start: widget.start,
                          end: widget.end,
                        )));
          }, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ThanksPage(
                        covertype: widget.covertype,
                        insurer: "Jubilee Insurance",
                        premium: "KSH ${formatter.format(premium)}",
                        duration: "from ${widget.start} to ${widget.end}")));
          }),
          company(
              widget.make,
              widget.model,
              "img/directline.png",
              "KSH ${formatter.format(premium1)}",
              widget.covertype,
              () {},
              () {}),
          company(
              widget.make,
              widget.model,
              "img/britam.png",
              "KSH ${formatter.format(premium2)}",
              widget.covertype,
              () {},
              () {}),
          company(
              widget.make,
              widget.model,
              "img/icea.jpg",
              "KSH ${formatter.format(premium3)}",
              widget.covertype,
              () {},
              () {}),
          company(
              widget.make,
              widget.model,
              "img/oldmutual.png",
              "KSH ${formatter.format(premium4)}",
              widget.covertype,
              () {},
              () {}),
          company(
              widget.make,
              widget.model,
              "img/aar.png",
              "KSH ${formatter.format(premium5)}",
              widget.covertype,
              () {},
              () {}),
          company(
              widget.make,
              widget.model,
              "img/oldmutual.png",
              "KSH ${formatter.format(premium4)}",
              widget.covertype,
              () {},
              () {}),
        ],
      ),
    );
  }
}
