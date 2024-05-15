import 'package:campmart/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(
          255, 44, 44, 61), // Set the background color to dark purple
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/google_logo.png'),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors
                  .white, // Set the color of the CircularProgressIndicator to white
            ),
          ],
        ),
      ),
    );
  }
}
