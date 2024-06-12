import 'dart:developer';

import 'package:assesment2/views/widgets/home_navbar_widget.dart';
import 'package:assesment2/views/screen/auth/login_views.dart';
import 'package:flutter/material.dart';

class RegisterPageScreen extends StatefulWidget {
  const RegisterPageScreen({super.key});

  @override
  State<RegisterPageScreen> createState() => _RegisterPageScreenState();
}

class _RegisterPageScreenState extends State<RegisterPageScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  bool isSignUpSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewInsets.top + 100,
              bottom: MediaQuery.of(context).viewInsets.bottom + 100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fill your data',
                        style: TextStyle(
                          color: Color.fromRGBO(59, 38, 122, 1),
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: 200,
                        child: Text(
                          'Upgrade your data for learning experience today and embrace the future of education with our exceptional learning application.',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignUpSelected = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSignUpSelected
                                  ? const Color.fromRGBO(59, 38, 122, 1)
                                  : Colors.white,
                              borderRadius: isSignUpSelected
                                  ? const BorderRadius.horizontal(
                                      left: Radius.circular(24.0),
                                    )
                                  : BorderRadius.circular(24.0),
                            ),
                            alignment: Alignment.center,
                            width: 150, // Adjust the width as needed
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: isSignUpSelected
                                    ? Colors.white
                                    : const Color.fromRGBO(59, 38, 122, 1),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignUpSelected = false;
                            });
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LoginPageScreen(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: !isSignUpSelected
                                  ? const Color.fromRGBO(59, 38, 122, 1)
                                  : Colors.white,
                              borderRadius: !isSignUpSelected
                                  ? const BorderRadius.horizontal(
                                      right: Radius.circular(24.0),
                                    )
                                  : BorderRadius.circular(24.0),
                            ),
                            alignment: Alignment.center,
                            width: 150, // Adjust the width as needed
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: !isSignUpSelected
                                    ? Colors.white
                                    : const Color.fromRGBO(59, 38, 122, 1),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Space before form
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Grade',
                          style: TextStyle(
                            color: Color.fromRGBO(59, 38, 122, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _gradeController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your grade';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your Grade',
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(202, 203, 210, 1),
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Age',
                          style: TextStyle(
                            color: Color.fromRGBO(59, 38, 122, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _ageController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your age';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your age',
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(202, 203, 210, 1),
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Email Address',
                          style: TextStyle(
                            color: Color.fromRGBO(59, 38, 122, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _emailAddressController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your Email Address',
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(202, 203, 210, 1),
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Password',
                          style: TextStyle(
                            color: Color.fromRGBO(59, 38, 122, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your Password',
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(202, 203, 210, 1),
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 24),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                log('User registered');
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const HomeNavbarWidget(),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(59, 38, 122, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 140,
                                vertical: 12,
                              ),
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              
                            ),
                          ),
                        ),
                      ],
                    ),
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
