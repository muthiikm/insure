import 'package:flutter/material.dart';
import 'package:insure/models/riders.dart';
import 'package:insure/screens/categories/motor/addons.dart';
import 'package:insure/screens/categories/motor/carinfo.dart';
import 'package:insure/screens/categories/motor/thanks.dart';
import 'package:insure/widgets/btn.dart';
import 'package:insure/widgets/carinfo.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Quote extends StatefulWidget {
  final String insurer;
  final String covertype;
  final String rate;
  final String premium;
  final String start;
  final String end;
  const Quote(
      {required this.insurer,
      required this.covertype,
      required this.rate,
      required this.premium,
      required this.start,
      required this.end,
      super.key});

  @override
  State<Quote> createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
  var formatter = NumberFormat('#,###.##');
  int extraCharges = 1000;
  @override
  Widget build(BuildContext context) {
    final carDetailsModel = Provider.of<CarDetailsModel>(context);
    final addOnModel = Provider.of<AddOnModel>(context);
    final table = cartable(
        carDetailsModel.vehicle.regno,
        carDetailsModel.vehicle.make,
        carDetailsModel.vehicle.model,
        carDetailsModel.vehicle.yom);
    final totalRiders = double.parse(addOnModel.addoncost.addon1) +
        double.parse(addOnModel.addoncost.addon2) +
        double.parse(addOnModel.addoncost.addon3) +
        double.parse(addOnModel.addoncost.addon4) +
        double.parse(addOnModel.addoncost.addon5);
    final totalcost = double.parse(widget.premium) + totalRiders + extraCharges;
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Quote Details",
                style: TextStyle(fontSize: 22),
              ),
              details("Insurer", widget.insurer),
              details("Cover", widget.covertype),
              details("Sum Insured",
                  "KSH ${carDetailsModel.vehicle.value}"),
              details("Rate", " ${widget.rate} %"),
              details("Riders", "KSH ${formatter.format(totalRiders)}"),
              details("Premium", "KSH ${widget.premium}"),
              details("Extra Charges", "KSH ${formatter.format(extraCharges)}"),
              details("Total Cost", "KSH ${formatter.format(totalcost)}"),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Vehicle Information",
                style: TextStyle(fontSize: 17),
              ),
              table,
              // const Text(
              //   "Riders",
              //   style: TextStyle(fontSize: 17),),
              addonItem(),
              const SizedBox(
                height: 20,
              ),
              button(context, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThanksPage(
                            covertype: widget.covertype,
                            insurer: widget.insurer,
                            premium: "KSH ${widget.premium}",
                            duration:
                                "from ${widget.start} to ${widget.end}")));
              }, "Continue")
            ],
          ),
        ),
      ),
    );
  }

  Widget details(String text, String detail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
          const Spacer(),
          Text(
            detail,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}

Widget addonItem() {
  return selectedItem.isEmpty
      ? const Text(
          "No AddOns",
          style: TextStyle(fontSize: 20),
        )
      : SizedBox(
          height: 150,
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (_, i) {
                Rider rider = selectedItem[i];
                return Column(
                  children: [
                    const Text(
                      "Riders",
                      style: TextStyle(fontSize: 17),
                    ),
                    // Table(
                    //   border: TableBorder.all(),
                    //   children: [
                    //     const TableRow(children: [
                    //       TableCell(
                    //         child: Padding(
                    //           padding: EdgeInsets.all(8.0),
                    //           child: Text(
                    //             "Rider",
                    //             style: TextStyle(fontWeight: FontWeight.bold),
                    //           ),
                    //         ),
                    //       ),
                    //       TableCell(
                    //           child: Padding(
                    //         padding: EdgeInsets.all(8.0),
                    //         child: Text(
                    //           "Cost",
                    //           style: TextStyle(fontWeight: FontWeight.bold),
                    //         ),
                    //       )),
                    //     ]),
                    //     TableRow(children: [
                    //       TableCell(
                    //           child: Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Text(rider.name),
                    //       )),
                    //       TableCell(
                    //           child: Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Text("${rider.cost} KSH"),
                    //       )),
                    //     ]),
                    //   ],
                    // ),
                    DataTable(
                      columnSpacing: 4,
                      border: TableBorder.all(),
                        columns: const [
                          DataColumn(label: Text('Riders', style: TextStyle(fontWeight: FontWeight.bold ))),
                          DataColumn(label: Text('Cost', style: TextStyle(fontWeight: FontWeight.bold))),
                        ],
                        rows: selectedItem.map((item) {
                          return DataRow(cells: [
                            DataCell(Text(item.name)),
                            DataCell(Text(item.cost)),
                          ]);
                        }).toList(),)
                  ],
                );
              }),
        );
}
