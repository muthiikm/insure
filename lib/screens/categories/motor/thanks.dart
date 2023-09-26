import 'package:flutter/material.dart';
import 'package:insure/screens/categories/motor/carinfo.dart';
import 'package:insure/screens/categories/motor/valuation.dart';
import 'package:insure/utils/dialogboxes/success.dart';
import 'package:insure/widgets/btn.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ThanksPage extends StatefulWidget {
  final String covertype;
  final String insurer;
  final String premium;
  final String duration;
  const ThanksPage(
      {required this.covertype,
      required this.insurer,
      required this.premium,
      required this.duration,
      super.key});

  @override
  State<ThanksPage> createState() => _ThanksPageState();
}

class _ThanksPageState extends State<ThanksPage> {
  var formatter = NumberFormat("#,###.##");
  @override
  Widget build(BuildContext context) {
    final carDetailModel = Provider.of<CarDetailsModel>(context);
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              "Dear michael, Thank you for trusting ${widget.insurer} to insure your vehicle, ${carDetailModel.vehicle.regno}. \nWe have sent the risk note to your email.",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 6,
            ),
            summary(),
            const SizedBox(
              height: 10,
            ),
            button(context, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Valuation()));
            }, "Book Valuation"),
            button(context, () {
              successAlert(context, "Your application has been received");
            }, "Complete Application")
          ],
        ),
      ),
    );
  }

  Widget summary() {
    final carDetailModel = Provider.of<CarDetailsModel>(context);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 6.0,
                spreadRadius: 2.0,
                offset: Offset(0, 0)),
          ]),
      child: Column(
        children: [
          const Text(
            "Summary.",
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
          info("Cover", widget.covertype),
          info("Sum Insured",
              "KSH ${formatter.format(carDetailModel.vehicle.value)}"),
          info("Premium", "KSH ${widget.premium}"),
          info("Duration", widget.duration),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget info(String title, String detail) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 17),
          ),
          const Spacer(),
          Text(detail)
        ],
      ),
    );
  }
}
