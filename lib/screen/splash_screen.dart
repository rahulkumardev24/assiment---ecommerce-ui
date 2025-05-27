import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      /// here we navigate according to user session
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    });

    /// exit form full screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "lib/assets/images/im_splash_background_image.jpg",
                height: mqData.height * 0.7,
                width: mqData.width,
                fit: BoxFit.cover,
              ),
              SizedBox(height: mqData.height * 0.05),

              Image.asset(
                "lib/assets/icons/ic_splash.png",
                height: mqData.height * 0.1,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "DealsDray",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// This is my splash screen
