import 'package:application/helper/custom_text_style.dart';
import 'package:application/screen/home_screen.dart';
import 'package:application/widgets/navigation_icon_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context).size;
    return Scaffold(
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

      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  "lib/assets/icons/ic_splash.png",
                  height: mqData.height * 0.2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "DealsDray",
                    style: myTextStyle32(
                      fontWeight: FontWeight.bold,
                      textColor: Colors.black45,
                    ),
                  ),
                ),
          
                SizedBox(height: mqData.height * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Lets's Begin!", style: myTextStyle32()),
                      Text(
                        "please enter your credentials to proceed",
                        style: myTextStyle18(),
                      ),
          
                      SizedBox(height: 21),
          
                      /// email
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Your email",
                          hintStyle: myTextStyle18(textColor: Colors.black45),
                        ),
                      ),
          
                      SizedBox(height: 12),
          
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Create password",
                          hintStyle: myTextStyle18(textColor: Colors.black45),
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Referral code(Optional) ",
                          hintStyle: myTextStyle18(textColor: Colors.black45),
                        ),
                      ),
                    ],
                  ),
                ),
          
                SizedBox(height: mqData.height * 0.1),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          /// Navigate to home screen
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => HomeScreen()),
                          );
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: 27,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// currently working on register screen
