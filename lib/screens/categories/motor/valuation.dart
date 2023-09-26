import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:insure/utils/dialogboxes/success.dart';
import 'package:insure/widgets/btn.dart';
import 'package:insure/widgets/inputfield.dart';
import 'package:intl/intl.dart';

class Valuation extends StatefulWidget {
  const Valuation({super.key});

  @override
  State<Valuation> createState() => _ValuationState();
}

class _ValuationState extends State<Valuation> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  TextEditingController locationCont = TextEditingController();
  bool checked1 = false;
  bool checked2 = false;
  bool checked3 = false;
  bool checked4 = false;

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.lightBlue.shade100,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Book Valuation Below",
              style: TextStyle(fontSize: 22),
            ),
            valuers(),
            date(),
            time(),
            signupField("Location", locationCont, false,
                RequiredValidator(errorText: "* Required"), TextInputType.text, ),
            const SizedBox(
              height: 10,
            ),
            button(context, () {
              successAlert(context, "Valuation booked succesfully",);
            }, "Book")
          ],
        ),
      ),
    );
  }

  Widget valuers() {
    return Column(
      children: [
        option("Regent Valuers", checked1, (bool? value) {
          setState(() {
            checked1 = value!;
          });
        }),
        option("Queens Valuers Assesors", checked2, (bool? value) {
          setState(() {
            checked2 = value!;
          });
        }),
        option("County Valuers Assesors", checked3, (bool? value) {
          setState(() {
            checked3 = value!;
          });
        }),
        option("Kings Valuers", checked4, (bool? value) {
          setState(() {
            checked4 = value!;
          });
        }),
      ],
    );
  }

  Widget option(String title, bool? value, Function(bool?)? onChanged) {
    return CheckboxListTile(
        title: Text(title), value: value, onChanged: onChanged);
  }

  Widget date() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        readOnly: true,
        onTap: tapped,
        controller: dateinput,
        decoration: InputDecoration(
          // hintText: dateinput.text,
          label: const Text("Valuation Date"),
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

  Widget time() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        readOnly: true,
        onTap: tap,
        controller: timeinput,
        decoration: InputDecoration(
          // hintText: dateinput.text,
          label: const Text("Valuation Time"),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.schedule,
            ),
          ),
        ),
      ),
    );
  }

  void tapped() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      //you can implement different kind of Date Format here according to your requirement

      setState(() {
        dateinput.text = formattedDate; //set output date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }

  void tap() async {
    final localizations = MaterialLocalizations.of(context);
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      print(pickedTime); //pickedDate output format => 2021-03-10 00:00:00.000
      // String formattedTime = DateFormat('yyyy-MM-dd').format(pickedDate);
      String formattedTime = localizations.formatTimeOfDay(pickedTime);
      print(
          formattedTime); //formatted date output using intl package =>  2021-03-16
      //you can implement different kind of Date Format here according to your requirement

      setState(() {
        timeinput.text = formattedTime; //set output date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }
}
