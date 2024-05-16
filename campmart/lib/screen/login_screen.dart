import 'package:flutter/material.dart';
import '../models/login_model.dart'; // Import the LoginModel
import '../screen/register_screen.dart';
import '../screen/dashboard_screen.dart'; // Import the DashboardScreen

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _loginModel =
      LoginModel(email: '', password: ''); // Create an instance of LoginModel
  bool _obscureText = true; // To toggle password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CampMart',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 44, 44, 61),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 44, 44, 61),
                  Color.fromARGB(255, 75, 75, 105),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        'Please login to continue',
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 24.0),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Email address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email address';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _loginModel.email = value!;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _loginModel.password = value!;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // Handle login logic
                            if (_loginModel.authenticate()) {
                              // Assuming login is successful, navigate to the DashboardScreen
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashboardScreen()),
                              );
                            } else {
                              // Show an error message or handle failed authentication
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 44, 44, 61),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle forgot password action
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      const Text(
                        '------or continue with------',
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Handle Facebook sign-in
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Color.fromARGB(255, 6, 6, 6),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: const EdgeInsets.all(12.0),
                            ),
                            child: Image.asset(
                              'assets/images/facebook_logo.png',
                              height: 24.0,
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          ElevatedButton(
                            onPressed: () {
                              // Handle Apple sign-in
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: const EdgeInsets.all(12.0),
                            ),
                            child: Image.asset(
                              'assets/images/apple_logo.png',
                              height: 24.0,
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          ElevatedButton(
                            onPressed: () {
                              // Handle Apple sign-in
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: const EdgeInsets.all(12.0),
                            ),
                            child: Image.asset(
                              'assets/images/google_logo.png',
                              height: 24.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()),
                          );
                          // Navigate to sign-up page
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 44, 44, 61),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                        ),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
