import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_screen.dart';
import 'home_screen.dart'; // Replace with your actual home screen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _navigateBasedOnAuth();

    // Exit from full screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  Future<void> _navigateBasedOnAuth() async {
    await Future.delayed(Duration(seconds: 2)); // Show splash for 2 seconds

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User is logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } else {
      // User is NOT logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    }
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
                height: mqData.height * 0.6,
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
