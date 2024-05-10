import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/styles/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;

  TextEditingController _EmailEditingController = TextEditingController();
  TextEditingController _PassTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 90),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/logo.svg",
                    height: 180,
                    width: 180,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 200.0),
                    child: Text("Get started", style: HeadText1(lightTeal)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                      controller: _EmailEditingController,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      decoration: textField("Enter your name", "John Doe")),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                      controller: _PassTextEditingController,
                      style: const TextStyle(fontSize: 18),
                      obscureText: _isObscure,
                      decoration: passwordField(
                        "Enter password",
                        IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
