import 'package:assesment2/data/local/todo_db.dart';
import 'package:assesment2/data/local/model/todo.dart';
import 'package:assesment2/data/materi_controller.dart';
import 'package:assesment2/data/todo_controller.dart';
import 'package:assesment2/firebase_options.dart';
import 'package:assesment2/views/screen/auth/login_views.dart';
import 'package:assesment2/views/widgets/home_navbar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Pastiin semua widget flutter initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await TodoDB.init();

  Get.put(TodoController(), permanent: true);
  Get.put(MateriController(), permanent: true);

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
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: FirebaseAuth.instance.currentUser != null ? const HomeNavbarWidget() : const LoginPageScreen(),
    );
  }
}
