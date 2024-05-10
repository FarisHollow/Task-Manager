import 'package:flutter/material.dart';
import 'package:task_manager/screens/onBoarding/email_verification_screen.dart';
import 'package:task_manager/screens/onBoarding/login_screen.dart';
import 'package:task_manager/screens/onBoarding/pin_verification_screen.dart';
import 'package:task_manager/screens/onBoarding/registration_screen.dart';
import 'package:task_manager/screens/onBoarding/set_password_screen.dart';
import 'package:task_manager/screens/onBoarding/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',

      routes: {

        '/': (context) => const SplashScreen(),
        '/email': (context) => const EmailVerificationScreen(),
        '/pin': (context) => const PinVerificationScreen(),
        '/login': (context) => const LoginScreen(),
        '/registration': (context) => const RegistrationScreen(),
        '/setPassword': (context) => const SetPasswordScreen(),

      },
    );
  }
}


