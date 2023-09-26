import 'package:flutter/material.dart';
import 'package:insure/screens/categories/motor/underwriter.dart';
import 'package:insure/widgets/btn.dart';
import 'package:intl/intl.dart';

class TimeRange extends StatefulWidget {
  final String make;
  final String model;
  final String yom;
  final String value;
  final String covertype;
  final String rate;
  const TimeRange(
      {required this.make,
      required this.model,
      required this.yom,
      required this.value,
      required this.covertype,
      required this.rate,
      super.key});

  @override
  State<TimeRange> createState() => _TimeRangeState();
}

class _TimeRangeState extends State<TimeRange> {
  DateTime? selectedDate;
  TextEditingController startdate = TextEditingController();
  TextEditingController enddate = TextEditingController();

  @override
  void initState() {
    startdate.text = "";
    enddate.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("How Long do you want the cover to be?"),
            const SizedBox(height: 10,),
            date(tapped1, startdate, "From"),
            date(tapped2, enddate, "To"),
            button(context, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Companies(
                          make: widget.make,
                          model: widget.model,
                          yom: widget.yom,
                          value: widget.value,
                          covertype: widget.covertype,
                          rate: widget.rate,
                          start: startdate.text,
                          end: enddate.text)));
            }, "Continue")
          ],
        ),
      ),
    );
  }

  Widget date(Function()? ontap, TextEditingController cont, String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        readOnly: true,
        onTap: ontap,
        controller: cont,
        decoration: InputDecoration(
          // hintText: dateinput.text,
          label: Text(label),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.calendar_month,
            ),
          ),
        ),
      ),
    );
  }

  void tapped1() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      // String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      String formattedDate = DateFormat.yMMMd().format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      //you can implement different kind of Date Format here according to your requirement

      setState(() {
        startdate.text = formattedDate; //set output date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }

    void tapped2() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat.yMMMd().format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      //you can implement different kind of Date Format here according to your requirement

      setState(() {
        enddate.text = formattedDate; //set output date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }
}
