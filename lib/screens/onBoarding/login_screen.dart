import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manager/screens/onBoarding/email_verification_screen.dart';
import 'package:task_manager/screens/onBoarding/registration_screen.dart';
import 'package:task_manager/styles/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  
  final emailRegex =
  RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  TextEditingController _EmailEditingController = TextEditingController();
  TextEditingController _PassTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Form(
            key: _formKey,
            child: Container(
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
                      child: Text("Get started", style: HeadText1(deepTeal, 20)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                        controller: _EmailEditingController,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        decoration:
                            textField("Enter your email", "example@gmail.com"),

                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your email';
                        } else if (!emailRegex.hasMatch(value!)) {
                          return 'Invalid email format';
                        }
                        return null;
                      },
                    ),
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
                      ),
                      validator: (String? value) {
                        if ((value?.isEmpty ?? true) || value!.length < 8) {
                          return 'Enter password correctly with minimum 8 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          style: button(
                            const Size(100, 40),
                          ),
                          onPressed: () { if(!_formKey.currentState!.validate()){
                            return;
                          }},
                          icon: const Icon(Icons.login_rounded,
                              color: Colors.white),
                          label: Text("Sign In", style: HeadText1(white, 15)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: forgotPass(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, letterSpacing: 0.5),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(const RegistrationScreen());
                            },
                            child: const Text('Sign up')),
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
