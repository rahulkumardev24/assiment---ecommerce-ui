import 'package:application/helper/custom_text_style.dart';
import 'package:application/screen/register_screen.dart';
import 'package:application/widgets/navigation_icon_button.dart';
import 'package:application/widgets/text_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isShowing = false;
  bool isMobileSelected = true;

  final TextEditingController phoneController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void sendOTP() async {
    String phoneNumber = "+91${phoneController.text.trim()}";

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 120),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "Verification failed")),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => OTPScreen(
                  verificationId: verificationId,
                  otpSendNumber: phoneNumber,
                ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: NavigationIconButton(onTap: () {}),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 7,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// logo
                      Image.asset(
                        "lib/assets/icons/ic_splash.png",
                        height: mqData.height * 0.15,
                      ),

                      /// title
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          "DealsDeary",
                          style: myTextStyle32(
                            textColor: Colors.black45,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),

                      SizedBox(height: 24),

                      /// tab part
                      Container(
                        width: mqData.width * 0.5,
                        height: mqData.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(21),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// here we call tab button
                            tabButton(
                              text: "Phone",
                              isSelected: isMobileSelected,
                            ),
                            tabButton(
                              text: "Email",
                              isSelected: !isMobileSelected,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: mqData.height * 0.05),
                    ],
                  ),
                ),
              ),

              /// show ui according to email or phone
              isMobileSelected
                  ? Expanded(
                    flex: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Glad to see you!",
                              style: myTextStyle32(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "please provide your phone number",
                              style: myTextStyle18(),
                            ),
                            SizedBox(height: mqData.height * 0.1),
                            TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Phone",
                                hintStyle: myTextStyle18(),
                              ),
                            ),

                            SizedBox(height: mqData.height * 0.05),

                            /// here we call text button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyTextButton(
                                  btnText: "SEND CODE",
                                  onPress: sendOTP,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  : Expanded(
                    flex: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Glad to see you!",
                              style: myTextStyle32(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "please provide your email",
                              style: myTextStyle18(),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 21),

                                  /// email
                                  TextField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      hintText: "Your email",
                                      hintStyle: myTextStyle18(
                                        textColor: Colors.black45,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 12),

                                  TextField(
                                    obscureText: !isShowing,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      hintText: "password",
                                      hintStyle: myTextStyle18(
                                        textColor: Colors.black45,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isShowing = !isShowing;
                                          });
                                        },
                                        icon: Icon(
                                          isShowing
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyTextButton(
                                  btnText: "Login",
                                  onPress: () async {
                                    String email = emailController.text.trim();
                                    String password =
                                        passwordController.text.trim();

                                    if (email.isEmpty || password.isEmpty) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Please enter both email and password.",
                                            style: myTextStyle18(
                                              textColor: Colors.white,
                                            ),
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    } else {
                                      try {
                                        // Attempt to sign in
                                        await FirebaseAuth.instance
                                            .signInWithEmailAndPassword(
                                              email: email,
                                              password: password,
                                            );

                                        // Navigate to home screen on success
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => HomeScreen(),
                                          ),
                                        );
                                      } on FirebaseAuthException catch (e) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              "Login failed",
                                              style: myTextStyle18(
                                                textColor: Colors.white,
                                              ),
                                            ),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),

                            SizedBox(height: 21),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don,t have an account ",
                                  style: myTextStyle18(),
                                ),
                              ],
                            ),

                            /// here we call text button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyTextButton(
                                  btnText: "Create account",
                                  backgroundColor: Colors.blueAccent.withAlpha(
                                    70,
                                  ),
                                  onPress: () {
                                    /// navigate to register screen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => RegisterScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabButton({required String text, required bool isSelected}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isMobileSelected = (text == "Phone");
        });
      },
      child: Container(
        /// tab color according to selected or not
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.grey,
          borderRadius: BorderRadius.circular(21),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
          child: Text(
            text,
            style: myTextStyle21(
              textColor: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

/// before stat new part , my laptop is suddenly off , and recording file is crept
/// i will show what we completed
