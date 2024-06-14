// import 'package:flutter/material.dart';
// import 'dart:async';
// import '../screen/login_screen.dart'; // Ensure the path is correct

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//       const Duration(seconds: 1), //Duration for splash screen
//       () => Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const LoginPage()),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: Color.fromARGB(255, 44, 44, 61),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Hey There",
//               style: TextStyle(fontSize: 50),
//             ),
//             // Adjusted size for better appearance
//             // Image.asset(
//             //   'assets/images/app_logo.ico', // Ensure the image format is appropriate
//             //   width: 150, // Width of the logo
//             //   height: 150, // Height of the logo
//             // ),
//             SizedBox(height: 20),
//             CircularProgressIndicator(
//               color: Colors.white,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
