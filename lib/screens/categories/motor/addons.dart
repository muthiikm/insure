import 'package:flutter/material.dart';
import 'package:insure/models/riders.dart';
import 'package:insure/screens/categories/motor/carinfo.dart';
import 'package:insure/screens/categories/motor/duration.dart';
import 'package:insure/widgets/btn.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Riders extends StatefulWidget {
  final String make;
  final String model;
  final String yom;
  final String value;
  final String covertype;
  final String rate;
  const Riders(
      {required this.make,
      required this.model,
      required this.yom,
      required this.value,
      required this.covertype,
      required this.rate,
      super.key});

  @override
  State<Riders> createState() => _RidersState();
}

class _RidersState extends State<Riders> {
  bool isChecked = false;
  bool checked1 = false;
  bool checked2 = false;
  bool checked3 = false;
  bool checked4 = false;
  var formatter = NumberFormat('#,###');
  List<bool> checkedList = [false, false, false, false, false];

  bool checked5 = false;
  String addon1 = "0";
  String addon2 = "0";
  String addon3 = "0";
  String addon4 = "0";
  String addon5 = "0";
  List selectedItems = [];
  List selectedCost = [0, 0, 0, 0, 0];
  int count = 0;
  num sum = 0;

  List<Rider> availableItems = [
    Rider(name: "Courtesy Car", cost: "10000"),
    Rider(name: "Excess Protector", cost: "4000"),
    Rider(name: "Windscreen Cover", cost: "2000"),
    Rider(name: "Personal Accident", cost: "3000"),
    Rider(name: "Music System", cost: "2000"),
  ];

  bool skip = false;

  void onItemChecked(bool value, int index) {
    setState(() {
      checkedList[index] = value;
      count = checkedList.where((isChecked) => isChecked).length;
    });
  }

  @override
  void initState() {
    addon1;
    addon2;
    addon3;
    addon4;
    addon5;
    count;
    selectedItems;
    selectedCost;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final addOns = Provider.of<AddOnModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Vehicle Riders"),
        ),
        backgroundColor: Colors.lightBlue.shade100,
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Select the riders that you would be interested in",
                style: TextStyle(fontSize: 18),
              ),
              addRiders(),
              Text("Selected riders: $count"),
              Text("Total Cost: KSH ${formatter.format(sum)}"),
              button(context, () {
                addOns.setRider(AddOn(
                    addon1: addon1,
                    addon2: addon2,
                    addon3: addon3,
                    addon4: addon4,
                    addon5: addon5));
                if (skip = false) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TimeRange(
                                make: widget.make,
                                model: widget.model,
                                yom: widget.yom,
                                value: widget.value,
                                covertype: widget.covertype,
                                rate: widget.rate,
                              )));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TimeRange(
                                make: widget.make,
                                model: widget.model,
                                yom: widget.yom,
                                value: widget.value,
                                covertype: widget.covertype,
                                rate: widget.rate,
                              )));
                }
              }, skip ? "Continue" : "Skip")
            ],
          ),
        ));
  }

  Widget rider(
      bool? value, String title, String cost, Function(bool?)? onChanged) {
    return CheckboxListTile(
      title: Row(
        children: [Text(title), const Spacer(), Text(cost)],
      ),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.black,
      checkColor: Colors.white,
      // tileColor: Colors.black12,
      controlAffinity: ListTileControlAffinity.leading,
      tristate: false,
    );
  }

  Widget addRiders() {
    return Column(
      children: [
        rider(checked1, availableItems[0].name,
            "KSH ${formatter.format(int.parse(availableItems[0].cost))}",
            (bool? value) {
          print(selectedItem.length);
          setState(() {
            checked1 = value!;
            addon1 = availableItems[0].cost;
            // totalCost();
            skip = checked1 || checked2 || checked3 || checked4 || checked5;
            if (value) {
              setState(() {
                selectedItems.add(1);
                count = selectedItems.length;
                // selectedCost[0] = int.parse(availableItems[0].cost);
                // totalCost();
              });
              selectedItem.add(availableItems[0]);
            } else {
              setState(() {
                selectedItems.removeAt(0);
                count = selectedItems.length;
              });
              selectedItem
                  .removeWhere((item) => item.name == availableItems[0].name);
            }
          });
          // total = int.parse(addon1);
        }),
        rider(checked2, availableItems[1].name,
            "KSH ${formatter.format(int.parse(availableItems[1].cost))}",
            (bool? value) {
          setState(() {
            checked2 = value!;
            addon2 = availableItems[1].cost;
            skip = checked1 || checked2 || checked3 || checked4 || checked5;
            if (value) {
              setState(() {
                selectedItems.add(1);
                count = selectedItems.length;
              });
              selectedItem.add(availableItems[1]);
            } else {
              setState(() {
                selectedItems.removeAt(0);
                count = selectedItems.length;
              });
              selectedItem
                  .removeWhere((item) => item.name == availableItems[1].name);
            }
          });
        }),
        rider(checked3, availableItems[2].name,
            "KSH ${formatter.format(int.parse(availableItems[2].cost))}",
            (bool? value) {
          setState(() {
            checked3 = value!;
            addon3 = availableItems[2].cost;
            skip = checked1 || checked2 || checked3 || checked4 || checked5;
            count = selectedItem.length;
            if (value) {
              setState(() {
                selectedItems.add(1);
                count = selectedItems.length;
              });
              selectedItem.add(availableItems[2]);
            } else {
              setState(() {
                selectedItems.removeAt(0);
                count = selectedItems.length;
              });
              selectedItem
                  .removeWhere((item) => item.name == availableItems[2].name);
            }
          });
        }),
        rider(checked4, availableItems[3].name,
            "KSH ${formatter.format(int.parse(availableItems[3].cost))}",
            (bool? value) {
          setState(() {
            checked4 = value!;
            addon4 = availableItems[3].cost;
            skip = checked1 || checked2 || checked3 || checked4 || checked5;
            count = selectedItem.length;
            if (value) {
              setState(() {
                selectedItems.add(1);
                count = selectedItems.length;
              });
              selectedItem.add(availableItems[3]);
            } else {
              setState(() {
                selectedItems.removeAt(0);
                count = selectedItems.length;
              });
              selectedItem
                  .removeWhere((item) => item.name == availableItems[3].name);
            }
          });
        }),
        rider(checked5, availableItems[4].name,
            "KSH ${formatter.format(int.parse(availableItems[4].cost))}",
            (bool? value) {
          setState(() {
            checked5 = value!;
            addon5 = availableItems[4].cost;
            skip = checked1 || checked2 || checked3 || checked4 || checked5;
            count = selectedItem.length;
            if (value) {
              setState(() {
                selectedItems.add(1);
                count = selectedItems.length;
              });
              selectedItem.add(availableItems[4]);
            } else {
              setState(() {
                selectedItems.removeAt(0);
                count = selectedItems.length;
              });
              selectedItem
                  .removeWhere((item) => item.name == availableItems[4].name);
            }
          });
        }),
      ],
    );
  }

  totalCost() {
    // sum = int.parse(addon1) +
    //     int.parse(addon2) +
    //     int.parse(addon3) +
    //     int.parse(addon4) +
    //     int.parse(addon5);
    for (num e in selectedCost) {
      sum += e;
    }
  }
}
