import 'package:campmart/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'CampMart',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Please login to continue',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      key: const ValueKey('email'),
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email address',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      key: const ValueKey('password'),
                      controller: _passwordController,
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscure ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await ref
                              .read(authViewModelProvider.notifier)
                              .loginStudent(
                                _emailController.text,
                                _passwordController.text,
                              );
                        }
                      },
                      child: const SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        // Handle forgot password
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '------or continue with------',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            // Handle Facebook login
                          },
                          icon: const Icon(Icons.facebook),
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          onPressed: () {
                            // Handle Apple login
                          },
                          icon: const Icon(Icons.apple),
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          onPressed: () {
                            // Handle Google login
                          },
                          icon: Image.asset(
                              'assets/images/google_icon.png'), // Use Image.asset
                          iconSize: 2.0, // Adjust the size as needed
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      key: const ValueKey('signUpButton'),
                      onPressed: () {
                        ref
                            .read(authViewModelProvider.notifier)
                            .openRegisterView();
                      },
                      child: const SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
