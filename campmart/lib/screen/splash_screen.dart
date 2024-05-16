import 'package:flutter/material.dart';
import 'dart:async';
import '../screen/login_screen.dart'; // Ensure the path is correct

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(
          seconds: 2), // Increased duration to give a better splash effect
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: const Color.fromARGB(255, 44, 44, 61),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hey There",
              style: TextStyle(fontSize: 50),
            ),
            // Adjusted size for better appearance
            // Image.asset(
            //   'assets/images/app_logo.ico', // Ensure the image format is appropriate
            //   width: 150, // Width of the logo
            //   height: 150, // Height of the logo
            // ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
