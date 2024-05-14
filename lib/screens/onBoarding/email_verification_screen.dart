import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/screens/onBoarding/login_screen.dart';
import 'package:task_manager/screens/onBoarding/pin_verification_screen.dart';
import 'package:task_manager/styles/styles.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  TextEditingController _EmailEditingController = TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  final emailRegex =
  RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

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
                    Padding(
                      padding: const EdgeInsets.only(right: 105.0),
                      child: Text("Your Email Address", style: HeadText1(deepTeal, 20)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    Text("6 digit pin code will be sent to your email", style: HeadText1(deepGreen, 14)),
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
                      height: 16,
                    ),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          style: button(const Size(328, 40)),
                          onPressed: () {
                            if(!_formKey.currentState!.validate()){

                              Get.to(const PinVerificationScreen());
                              return;
                            }
                            // Start sign-up process
                            // Set _signUpInProgress to true
                          },
                          icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                          label: Text("Send OTP", style: HeadText1(white, 15)),
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
                          "Have an account?",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, letterSpacing: 0.5),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(const LoginScreen());
                            },
                            child: const Text('Sign in')),
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
