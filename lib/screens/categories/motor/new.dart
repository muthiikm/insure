import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:insure/screens/categories/motor/addons.dart';
import 'package:insure/screens/categories/motor/carinfo.dart';
import 'package:insure/screens/categories/motor/underwriter.dart';
import 'package:insure/widgets/inputfield.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../widgets/btn.dart';

class NewVehicle extends StatefulWidget {
  final String covertype;
  final String rate;
  const NewVehicle({required this.covertype, required this.rate, super.key});

  @override
  State<NewVehicle> createState() => _NewVehicleState();
}

class _NewVehicleState extends State<NewVehicle> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController make = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController regno = TextEditingController();
  TextEditingController value = TextEditingController();
  TextEditingController yom = TextEditingController();
  var formatter = NumberFormat('#,###.##');



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final carDetailsModel = Provider.of<CarDetailsModel>(context);
    // final formm = Form(
    //     child: ElevatedButton(
    //   onPressed: () {
    //     carDetailsModel.setCar(CarDetails(
    //         make: "toyota",
    //         model: "corona",
    //         regno: "kda 123",
    //         value: "1200000",
    //         yom: "2012"));
    //   },
    //   child: Text("save"),
    // ));
    // String carmake = widget.
    return Scaffold(body: body());
  }

  Widget form() {
    return Form(
      key: key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          motorInfo(
              "What is the make of the vehicle?",
              "make",
              make,
              false,
              RequiredValidator(errorText: "* Required"),
              TextInputType.text,),
          motorInfo(
              "What is the model of the vehicle?",
              "model",
              model,
              false,
              RequiredValidator(errorText: "* Required"),
              TextInputType.text, ),
          motorInfo(
              "What is the year of manufacture?",
              "yom",
              yom,
              false,
              RequiredValidator(errorText: "* Required"),
              TextInputType.datetime,),
          motorInfo(
              "What is the registration number of the vehicle?",
              "number plate",
              regno,
              false,
              RequiredValidator(errorText: "* Required"),
              TextInputType.text,),
          motorInfo(
              "What is the estimated value of the car in KSH?",
              "value",
              value,
              false,
              RequiredValidator(errorText: "* Required"),
              TextInputType.number,),
        ],
      ),
    );
  }

  Widget body() {
    final carDetailsModel = Provider.of<CarDetailsModel>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 13,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Flexible(
                  child: Text(
                    "Please provide the vehicle details below.",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Card(
              elevation: 3.0,
              child: form(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          button(context, () {
            carDetailsModel.setCar(CarDetails(
                make: make.text,
                model: model.text,
                regno: regno.text,
                value: value.text,
                yom: yom.text));
            next();
          }, "Continue"),
        ],
      ),
    );
  }

  void next() {
    if (key.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Riders(
                  make: make.text,
                  model: model.text,
                  yom: yom.text,
                  value: value.text,
                  covertype: widget.covertype,
                  rate: widget.rate)));
    } else {
      Fluttertoast.showToast(msg: "please fill out all fields");
    }
  }
}
