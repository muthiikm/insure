import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../services/passwordauth.dart';
import '../../utils/snackbar.dart';
import '../../widgets/btn.dart';
import '../../widgets/card.dart';
import '../../widgets/dots.dart';
import '../../widgets/inputfield.dart';
import '../navpages/bottomnav.dart';
import 'userinfo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  PassAuth passauth = PassAuth();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final auth = FirebaseAuth.instance;

  bool obscurePass = true;
  bool loading = false;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  void view() {
    setState(() {
      obscurePass = !obscurePass;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Page",
          style: TextStyle(color: Colors.lightBlue),
        ),
        backgroundColor: Colors.lightBlue.shade100,
      ),
      // backgroundColor: Colors.lightBlue.shade100,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign In With",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              loginCard(form()),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "Or",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 6,
              ),
              social(),
            ],
          ),
        ),
      ),
    );
  }

  Widget form() {
    return Form(
      key: key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          loginField(
              "Email",
              username,
              false,
              MultiValidator([
                RequiredValidator(errorText: "* Required"),
                EmailValidator(errorText: "* Enter a correct email")
              ]),
              TextInputType.emailAddress),
          loginField(
            "Password",
            password,
            obscurePass,
            passauth.validate,
            TextInputType.visiblePassword,
            8,
            view,
            obscurePass ? Icons.visibility : Icons.visibility_off,
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "forgot password?",
                    ))
              ],
            ),
          ),
          // button(context, loginUser, "login"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width / 1,
              child: ElevatedButton(
                  onPressed: loginUser,
                  child: loading == true ? spinkit() : const Text("login")),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          textbtn(
            () {
              Navigator.pushNamed(context, "/");
            },
            "Not a member? SignUp now",
          ),
        ],
      ),
    );
  }

  details() {
    if (key.currentState!.validate()) {
      print("username is ${username.text}");
      print("password is ${password.text}");
      key.currentState!.reset();
    } else {
      return;
    }
    // username.clear();
    // password.clear();
  }

  // Widget social() {
  //   return Container(
  //     width: MediaQuery.of(context).size.width / 1.0,
  //     padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         socialBtn(ButtonType.google, () {
  //           handleSignIn();
  //         }),
  //         socialBtn(ButtonType.facebook, () {}),
  //         socialBtn(ButtonType.linkedin, () {})
  //       ],
  //     ),
  //   );
  // }

  Widget social() {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 1.3,
        child: SignInButton(Buttons.Google, onPressed: () {}));
  }

  void loginUser() async {
    if (key.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const NavBar(
                    index: 0,
                  )));
      setState(() {
        loading = true;
      });
      try {
        await _auth.signInWithEmailAndPassword(
            email: username.text, password: password.text);
        // if (!mounted) return;
        if (mounted) {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NavBar(
                        index: 0,
                      )));
        }

        // showSuccessMsg(context, 'Successful Login!');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "no user exists for that email");
        } else if (e.code == 'wrong-password') {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "wrong password entered");
        }
      } catch (e) {
        Fluttertoast.showToast(
            msg: 'Something went wrong', toastLength: Toast.LENGTH_LONG);
        setState(() {
          loading = false;
        });
      }
    } else {
      return null;
    }
    key.currentState!.reset();
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // final UserCredential userCredential =
    //     await auth.signInWithCredential(credential);
    // Sign in to Firebase with the credential.
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> handleSignIn() async {
    try {
      // Sign in with Google and obtain the user credential.
      final UserCredential userCredential = await signInWithGoogle();

      // Navigate to the profile details page and pass the user credential as an argument.
      // if (mounted) return;
      if (mounted) {
        if (userCredential.user != null) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NavBar(index: 0)));
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProfileDetails(userCredential: userCredential),
            ),
          );
        }
      }
    } catch (e) {
      showSnackBarText(context, e.toString());
    }
  }
}
