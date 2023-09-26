import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:insure/widgets/resend.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Verify your Account", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
          const SizedBox(height: 7,),
          const Text("Enter the verification code sent to your mobile phone", textAlign: TextAlign.center,),
          const SizedBox(height: 10,),
          OtpTextField(
            numberOfFields: 6,
            fillColor: Colors.black.withOpacity(0.1),
            filled: true,
          ),
          const SizedBox(height: 20,),
          resend((){}),
          const SizedBox(height: 20,),
          SizedBox(
            width: MediaQuery.of(context).size.width/1.3,
            child: ElevatedButton(
              onPressed: (){}, child: const Text("verify")),
          )

        ],
      ),
    );
  }
}