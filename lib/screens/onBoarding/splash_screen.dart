import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_manager/styles/styles.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  Future<void> navigateToLogin() async {

    Future.delayed(const Duration(seconds: 3)).then((_) async {
      if (mounted) {

        Get.offAll(const LoginScreen());}
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       children: [
         ScreenBackground(context),
         Container(
           padding: EdgeInsets.all(90),
           child: SvgPicture.asset("assets/images/logo.svg",
           alignment: Alignment.center,
             // fit: BoxFit.contain,

           ),
         )


       ],
     ),
    );
  }
}
