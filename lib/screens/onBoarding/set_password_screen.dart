import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/screens/onBoarding/login_screen.dart';
import 'package:task_manager/styles/styles.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {

  bool _isObscure = true ;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 90),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 120.0),
                      child: Text("Reset Password", style: HeadText1(deepTeal, 40)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _passwordTEController,
                      style: const TextStyle(fontSize: 18),
                      obscureText: _isObscure,
                      decoration: passwordField(
                        "Enter password",
                        IconButton(
                          icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
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
                      height: 8,
                    ),
                    TextFormField(
                      controller: _confirmPasswordTEController,
                      style: const TextStyle(fontSize: 18),
                      obscureText: _isObscure,
                      decoration: passwordField(
                        "Confirm password",
                        IconButton(
                          icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                      validator: (String? value) {
                        if (value != _passwordTEController.text) {
                          return 'Passwords do not match';
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
                              return;
                            }
                            // Start sign-up process
                            // Set _signUpInProgress to true
                          },
                          icon: const Icon(Icons.app_registration, color: Colors.white),
                          label: Text("Reset", style: HeadText1(white, 15)),
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
                          "Already have an account?",
                          style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: 0.5),
                        ),
                        TextButton(
                          onPressed: () {Get.to(const LoginScreen());},
                          child: const Text('Sign in'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
