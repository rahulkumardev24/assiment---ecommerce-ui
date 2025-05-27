import 'package:application/helper/custom_text_style.dart';
import 'package:application/screen/register_screen.dart';
import 'package:application/widgets/navigation_icon_button.dart';
import 'package:application/widgets/text_button.dart';
import 'package:flutter/material.dart';

import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isMobileSelected = true;
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
                                  onPress: () {
                                    /// navigate to OTP screen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => OTPScreen(),
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
                  )
                  : Expanded(
                    flex: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                          SizedBox(height: mqData.height * 0.2),

                          /// here we call text button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyTextButton(
                                btnText: "Create account",
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
