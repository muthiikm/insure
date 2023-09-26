import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../services/passwordauth.dart';
import '../../utils/snackbar.dart';
import '../../widgets/btn.dart';
import '../../widgets/inputfield.dart';
import '../../widgets/resend.dart';
import '../navpages/bottomnav.dart';
import 'login.dart';
import 'userinfo.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> key = GlobalKey();
  final navigateKey = GlobalKey<NavigatorState>();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  PassAuth passAuth = PassAuth();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isObscure = true;
  String otpPin = " ";
  String countryDial = "+254";
  String verID = " ";
  int screenState = 0;
  final String _verificationId = "";

  @override
  void initState() {
    if (screenState != 0) {
      // verifyPhoneNumber("+254112209296");
      // verifyPhone("+254112209296");
    }
    name;
    email;
    password;
    phone;
    otpPin;
    super.initState();
  }

  @override
  void dispose() {
    // phone.dispose();
    super.dispose();
  }

  void verifyPhoneNumber(String phoneNo) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        Fluttertoast.showToast(msg: e.message ?? "an error occured");
      },
      codeSent: (String verificationId, int? resendToken) {
        showSnackBarText(context, "OTP Sent!");
        // _verificationId = verificationId;
        verID = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verID = verificationId;
        // _verificationId = verificationId;
      },
    );
  }

  void onVerifyOtpButtonPressed() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final String smsCode = otpPin.trim();
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        // verificationId: verID,
        verificationId: verID,
        smsCode: smsCode,
      );
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      final User? user = userCredential.user;
      if (user != null) {
        // navigateKey.currentState!.push(
        //     MaterialPageRoute(builder: (context) => const NavBar(index: 0)));
        // Fluttertoast.showToast(msg: "Account created succesfully");
        // Fluttertoast.showToast(msg: "Account created succesfully");
        // OTP verification successful, do something here
        if (mounted) {
          Fluttertoast.showToast(msg: "Account verified succesfully");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProfileDetails(userCredential: userCredential)));
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Profile Details"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      backgroundColor: Colors.lightBlue.shade100,
      body: screenState == 0 ? stateRegister() : stateOTP(),
    );
  }

  Widget form() {
    return Form(
      key: key,
      child: Column(
        children: [
          signupField("Full name", name, false,
              RequiredValidator(errorText: "* Required"), TextInputType.text, ),
          signupField(
              "Email",
              email,
              false,
              MultiValidator([
                RequiredValidator(errorText: "* Required"),
                EmailValidator(errorText: "* enter a correct email")
              ]),
              TextInputType.emailAddress),
          signupField("Phone", phone, false,
              RequiredValidator(errorText: "* Required"), TextInputType.phone),
          loginField(
            "Password",
            password,
            isObscure,
            passAuth.validate,
            TextInputType.visiblePassword,
            8,
            view,
            isObscure ? Icons.visibility : Icons.visibility_off,
          ),
          const SizedBox(
            height: 10,
          ),
          button(context, () {
            signUp();
            setState(() {
              verifyPhoneNumber(countryDial + phone.text);
            });
          }, "Sign Up"),
          const SizedBox(
            height: 10,
          ),
          textbtn(() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          }, "already have an account? log in")
        ],
      ),
    );
  }

  String? confirmPass(value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value != password.text) {
      return "passwords do not match";
    } else {
      return null;
    }
  }

  signup() {
    if (key.currentState!.validate()) {
      print("good to go");
    } else {
      print("something is off");
    }
  }

  void view() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  Widget stateRegister() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                      "Please provide your personal information below.",
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
          ],
        ),
      ),
    );
  }

  Widget stateOTP() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Verify your Account",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        const SizedBox(
          height: 7,
        ),
        const Text(
          "Enter the verification code sent to your mobile phone,",
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        OtpTextField(
          onCodeChanged: ((value) {
            // setState(() {
            //   otpPin = value;
            //   print(otpPin);
            // });
          }),
          onSubmit: ((value) {
            setState(() {
              otpPin = value;
            });
          }),
          numberOfFields: 6,
          fillColor: Colors.black.withOpacity(0.1),
          filled: true,
        ),
        const SizedBox(
          height: 20,
        ),
        resend(() {
          verifyPhone(countryDial + phone.text);
        }),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.3,
          child: ElevatedButton(
              onPressed: () {
                // onVerifyOtpButtonPressed();
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const NavBar(index: 0)));
                onVerifyOtpButtonPressed();
                // verifyOTP();
              },
              child: const Text("verify")),
        )
      ],
    );
  }

  Future<void> verifyPhone(String phoneNo) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 20),
      verificationCompleted: (PhoneAuthCredential credential) {
        showSnackBarText(context, "Auth Completed!");
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          showSnackBarText(context, "enter a correct phone number");
        } else {
          showSnackBarText(context, "Something went wrong!");
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        showSnackBarText(context, "OTP Sent!");
        verID = verificationId;
        // setState(() {
        //   screenState = 1;
        // });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        showSnackBarText(context, "Timeout!");
      },
    );
  }

  Future<void> verifyOTP() async {
    await FirebaseAuth.instance
        .signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verID,
        smsCode: otpPin,
      ),
    )
        .whenComplete(() async {
      navigateKey.currentState!.push(
          MaterialPageRoute(builder: (context) => const NavBar(index: 0)));
      // Fluttertoast.showToast(msg: "Account created succesfully");
      Fluttertoast.showToast(msg: "Account created succesfully");
      // OTP verification successful, do something here
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const NavBar(
            index: 0,
          ),
        ),
      );
    });
  }

  void signUp() async {
    var fullname = name.text.trim();
    var phoneno = phone.text.trim();
    var passcode = password.text.trim();
    var emaiL = email.text.trim();

    if (key.currentState!.validate()) {
      // setState(() {
      //   screenState = 1;
      // });
      try {
        FirebaseAuth auth = FirebaseAuth.instance;

        UserCredential userCredential = await auth
            .createUserWithEmailAndPassword(email: emaiL, password: passcode);
        if (userCredential.user != null) {
          //store user data
          DatabaseReference userRef =
              FirebaseDatabase.instance.ref().child('users');
          String uid = userCredential.user!.uid;
          await userRef.child(uid).set({
            'firstName': fullname,
            'uid': uid,
            'email': emaiL,
            'tel': phoneno,
            'idno': '',
            'profileImage': '',
            'dob': '',
            'county': ''
          });
          setState(() {
            // verifyPhoneNumber(countryDial + phone.text);
            verifyPhone(countryDial + phone.text);
            screenState = 1;
          });
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => const NavBar()));
          // verifyPhoneNumber(countryDial + phone.text);
          // Fluttertoast.showToast(msg: "account registered succesfully");
        } else {
          return;
          // if (!mounted) return;
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          Fluttertoast.showToast(msg: "that is email is already in use");
        } else if (e.code == 'weak-password') {
          Fluttertoast.showToast(msg: 'Password is too weak');
        }
      } catch (e) {
        print(e);
        Fluttertoast.showToast(
            msg: 'something went wrong $e', gravity: ToastGravity.CENTER);
      }
    } else {
      return null;
    }
    // verifyPhone(phone.text);
    // key.currentState!.reset();
    return null;
  }
}
