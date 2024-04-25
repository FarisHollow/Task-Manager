import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/styles/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
