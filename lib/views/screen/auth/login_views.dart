import 'package:assesment2/views/widgets/home_navbar_widget.dart';
import 'package:flutter/material.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(0),
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
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 340,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromRGBO(59, 38, 122, 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 165,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.transparent,
                            ),
                            child: const Center(
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 165,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Color.fromRGBO(59, 38, 122, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                      TextField(
                        controller: _emailAddressController,
                        decoration: InputDecoration(
                          hintText: 'Enter your Email Address',
                          hintStyle: const TextStyle(
                            color: Color.fromRGBO(202, 203, 210, 1),
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none),
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
                      TextField(
                        controller: _passwordController,
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
                      const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color.fromRGBO(59, 38, 122, 1),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HomeNavbarWidget(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(59, 38, 122, 1),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
