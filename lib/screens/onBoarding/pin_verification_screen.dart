import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/screens/onBoarding/login_screen.dart';
import 'package:task_manager/styles/styles.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {

  final TextEditingController _pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Form(

            child: Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 90),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 105.0),
                      child: Text("PIN Verification", style: HeadText1(deepTeal, 20)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    Text("6 digit pin code will be sent to your email", style: HeadText1(deepGreen, 14)),
                    const SizedBox(
                      height: 8,
                    ),
                    PinCodeTextField(
                      controller: _pinController,
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        inactiveFillColor: Colors.white,
                        inactiveColor: Colors.red,
                        activeColor: Colors.white,
                        selectedColor: Colors.green,
                        selectedFillColor: Colors.white,
                        activeFillColor: Colors.white,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      cursorColor: Colors.green,
                      enablePinAutofill: true,
                      onCompleted: (v) {},
                      onChanged: (value) {},
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                      appContext: context,
                    ),


                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          style: button(const Size(328, 40)),
                          onPressed: () {

                            // Start sign-up process
                            // Set _signUpInProgress to true
                          },
                          icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                          label: Text("Verify OTP", style: HeadText1(white, 15)),
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
