import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:insure/screens/navpages/bottomnav.dart';
import 'package:insure/utils/snackbar.dart';
import 'package:intl/intl.dart';

import '../../widgets/btn.dart';
import '../../widgets/inputfield.dart';

class ProfileDetails extends StatefulWidget {
  final UserCredential userCredential;
  const ProfileDetails({required this.userCredential, super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

List<String> options = ['Single', 'Married'];

class _ProfileDetailsState extends State<ProfileDetails> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  GlobalKey<FormState> key = GlobalKey();
  DateTime? selectedDate;
  TextEditingController idno = TextEditingController();
  TextEditingController county = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  String currentOption = options[0];
  late User user;

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
    user = widget.userCredential.user!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlue.shade100),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 6,
              ),
              const Text(
                "Update your details",
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 6,
              ),
              form()
            ],
          ),
        ),
      ),
    );
  }

  Widget form() {
    return Form(
      key: key,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            signupField(
                "ID number",
                idno,
                false,
                RequiredValidator(errorText: "* Required"),
                TextInputType.number),
            signupField("County", county, false,
                RequiredValidator(errorText: "* Required"), TextInputType.text,),
            date(),
            radio(),
            const SizedBox(
              height: 10,
            ),
            button(context, updateProfile, "Update Profile"),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  updateProfile() async {
    try {
      if (widget.userCredential.user != null) {
        //store user data
        DatabaseReference userRef =
            FirebaseDatabase.instance.ref().child('users');
        String uid = user.uid;
        await userRef.child(uid).set({
          'fullname': user.displayName,
          'uid': uid,
          'email': user.email,
          'phoneno': user.phoneNumber ?? "",
          'idno': idno.text,
          'profileImage': '',
          'dob': dateinput.text,
          'county': county.text,
          'maritalstatus': currentOption,
        });
        Fluttertoast.showToast(msg: "details updated!");
        if (mounted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NavBar(index: 0))); }
      } else {
        return;
      }
    } catch (e) {
      showSnackBarText(context, e.toString());
    }
  }

  // Widget date() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: DateTimeField(
  //         decoration: const InputDecoration(
  //           hintText: 'Please select your birth date',
  //           label: Text("yob"),
  //           border: UnderlineInputBorder(),
  //         ),
  //         selectedDate: selectedDate,
  //         onDateSelected: (DateTime value) {
  //           setState(() {
  //             selectedDate = value;
  //           });
  //         }),
  //   );
  // }
  Widget date() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        readOnly: true,
        onTap: tapped,
        controller: dateinput,
        decoration: InputDecoration(
          // hintText: dateinput.text,
          helperText: dateinput.text,
          label: const Text("year of birth"),
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

  Widget radio() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Marital Status",
          ),
          ListTile(
            title: const Text('Single'),
            leading: Radio(
              value: options[0],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Married'),
            leading: Radio(
              value: options[1],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
