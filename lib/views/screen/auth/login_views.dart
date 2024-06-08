import 'dart:developer';

import 'package:assesment2/views/widgets/home_navbar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref('users');

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
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
                        'Let\'s join with us',
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
                const SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'SORRY, THIS FEATURE IS UNDER DEVELOPMENT 👋',
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color.fromRGBO(59, 38, 122, 1),
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: _emailAddressController.text,
                                  password: _passwordController.text,
                                );

                                if (FirebaseAuth.instance.currentUser != null) {
                                  final user =
                                      FirebaseAuth.instance.currentUser;

                                  // Inisialisasi username
                                  final username = user!.email!.substring(
                                    0,
                                    user.email!.indexOf('@'),
                                  );

                                  // Cek database untuk user yang sekarang
                                  // ====== GET ======
                                  final snapshot = await ref
                                      .child('users/${user.uid}')
                                      .get();

                                  // Cek kalau usernya ada, gausah dibuat lagi
                                  // tapi diupdate pake data baru
                                  if (snapshot.exists) {
                                    // ====== UPDATE ======
                                    await ref
                                        .child(user.uid)
                                        .update({
                                      'username': username,
                                      'fullname': username,
                                      'email': user.email,
                                    });
                                  } else {
                                    // ====== CREATE ======
                                    await ref.child(user.uid).set({
                                      'username': username,
                                      'fullname': username,
                                      'email': user.email,
                                    });
                                  }
                                }
                              }

                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const HomeNavbarWidget(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(59, 38, 122, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 145,
                                vertical: 12,
                              ),
                            ),
                            child: const Text(
                              'Sign In',
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
