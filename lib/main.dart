import 'package:assesment2/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // Pastiin semua widget flutter initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set orientasi layar agar portrait (up / down)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: const LoginPageScreen(),
    );
  }
}
