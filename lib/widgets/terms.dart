import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:insure/utils/strings.dart';



class Agree extends StatefulWidget {
  const Agree({super.key});

  @override
  State<Agree> createState() => _AgreeState();
}

class _AgreeState extends State<Agree> {
  TextStyle defaultStyle = const TextStyle(fontSize: 17, color: Colors.black);
  TextStyle linkStyle = const TextStyle(color: Colors.blue);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 18),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(style: defaultStyle, children: [
              const TextSpan(text: AppText.terms),
              TextSpan(
                  text: AppText.conditions,
                  style: linkStyle,
                  recognizer: TapGestureRecognizer()..onTap = () {}),
              const TextSpan(text: "and that you have read our "),
              TextSpan(
                  text: "Privacy Policy",
                  style: linkStyle,
                  recognizer: TapGestureRecognizer()..onTap = () {})
            ]),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // SizedBox(
        //     width: MediaQuery.of(context).size.width / 1.2,
        //     child: button(context, () {
        //       Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
        //     }, "Continue"))
      ],
    );
  }
}
