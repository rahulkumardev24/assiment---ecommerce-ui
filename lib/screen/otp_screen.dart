import 'dart:async';

import 'package:application/helper/custom_text_style.dart';
import 'package:application/widgets/text_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../widgets/navigation_icon_button.dart';
import 'home_screen.dart';

class OTPScreen extends StatefulWidget {
  final String verificationId;
  String otpSendNumber;
  OTPScreen({
    super.key,
    required this.verificationId,
    required this.otpSendNumber,
  });

  @override
  State<OTPScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OTPScreen> {
  Timer? _timer;
  int _start = 120; // after 2 min user can resend the OTP
  bool isResendEnabled = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String otpCode = "";

  /// here we create function for 2 min timer
  void startTimer() {
    setState(() {
      isResendEnabled = false;
    });
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          isResendEnabled = true;
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _verifyOTP() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otpCode,
      );

      await _auth.signInWithCredential(credential);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("OTP Verified Successfully!")));

      // Navigate to home screen or next page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid OTP!")));
    }
  }

  /// get timer text
  String get timerText {
    final minutes = (_start ~/ 60).toString().padLeft(2, '0');
    final second = (_start % 60).toString().padLeft(2, '0');
    return "$minutes:$second";
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context).size;

    return Scaffold(
      /// app bar
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NavigationIconButton(
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),

      /// body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "lib/assets/icons/mobile_icon.png",
                height: mqData.height * 0.1,
              ),
              SizedBox(height: mqData.height * 0.05),
              Text(
                "OTP Verification",
                style: myTextStyle32(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),

              /// here show user enter mobile number
              Text(
                "We have sent a unique OTP number to your mobile +91- ${widget.otpSendNumber}",
                style: myTextStyle18(),
              ),

              SizedBox(height: mqData.height * 0.05),

              /// here we show pin box
              Pinput(
                length: 6,
                showCursor: true,
                onCompleted: (pin) => otpCode = pin,

                /// number keyboard show
                keyboardType: TextInputType.number,

                /// space between box
                separatorBuilder:
                    (index) => SizedBox(width: mqData.width * 0.05),

                defaultPinTheme: PinTheme(
                  height: 50,
                  width: 50,
                  textStyle: myTextStyle18(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  height: 50,
                  width: 50,
                  textStyle: myTextStyle18(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                ),

                /// submitted pin style
                submittedPinTheme: PinTheme(
                  height: 50,
                  width: 50,
                  textStyle: myTextStyle18(fontWeight: FontWeight.bold),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                ),
              ),

              SizedBox(height: 27),

              /// time and resend button show here
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(timerText, style: myTextStyle21()),
                  Text(
                    "SEND AGAIN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      fontFamily: "primary",
                      decoration: TextDecoration.underline,
                      color: isResendEnabled ? Colors.blue : Colors.black45,
                    ),
                  ),
                ],
              ),
              SizedBox(height: mqData.height * 0.1),

              /// verify button
              SizedBox(
                width: double.infinity,
                child: MyTextButton(
                  btnText: "Verify",
                  onPress: _verifyOTP,
                  backgroundColor: Colors.greenAccent,
                  btnTextColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
