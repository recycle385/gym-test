import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gym_credit_capstone/screen/find_password_screen.dart';
import 'screen/login_screen.dart';
import 'screen/signup_screen.dart';
import 'screen/success_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/success': (context) => SuccessScreen(),
        '/find_pw': (context) => FindPasswordScreen(),
      },
    );
  }
}